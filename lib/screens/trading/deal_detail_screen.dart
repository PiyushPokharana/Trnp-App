import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../providers.dart';
import '../transaction/record_transaction_sheet.dart';

class DealDetailScreen extends ConsumerWidget {
  final TruckDeal deal;

  const DealDetailScreen({super.key, required this.deal});

  void _showSellComponentDialog(BuildContext context, WidgetRef ref, VehicleComponent component) {
    final amountController = TextEditingController();
    PeopleData? selectedBuyer;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final peopleAsync = ref.watch(peopleStreamProvider);

            return AlertDialog(
              backgroundColor: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Text(
                'Sell Component (${component.componentType})',
                style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: amountController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Sale Price (₹) *',
                      labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                      filled: true,
                      fillColor: const Color(0xFF0F172A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  peopleAsync.when(
                    data: (people) {
                      return DropdownButtonFormField<PeopleData>(
                        value: selectedBuyer,
                        dropdownColor: const Color(0xFF1E293B),
                        style: const TextStyle(color: Colors.white, fontSize: 13),
                        decoration: InputDecoration(
                          labelText: 'Buyer (Optional)',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF0F172A),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        items: people.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                        onChanged: (val) => setDialogState(() => selectedBuyer = val),
                      );
                    },
                    loading: () => const SizedBox(),
                    error: (_, __) => const SizedBox(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel', style: TextStyle(color: Color(0xFF94A3B8))),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final price = double.tryParse(amountController.text.trim());
                    if (price == null || price <= 0) return;

                    final db = ref.read(databaseProvider);
                    final company = ref.read(selectedCompanyProvider);
                    final accounts = ref.read(paymentAccountsStreamProvider).value;

                    final categoryList = await db.watchCategories('Inflow').first;
                    final category = categoryList.firstWhere(
                      (c) => c.name.contains('Part Sale'),
                      orElse: () => categoryList.first,
                    );

                    await db.recordComponentSale(
                      TransactionsCompanion.insert(
                        companyId: company!.id,
                        categoryId: category.id,
                        dealId: drift.Value(deal.id),
                        vehicleId: drift.Value(deal.vehicleId),
                        componentId: drift.Value(component.id),
                        personId: drift.Value(selectedBuyer?.id),
                        amount: price,
                        direction: 'Inflow',
                        paymentMethod: drift.Value(accounts?.first.type ?? 'Cash'),
                        date: DateTime.now(),
                      ),
                      component.id,
                    );

                    if (context.mounted) {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${component.componentType} sold for ₹${price.toStringAsFixed(2)}'), backgroundColor: Colors.green),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade500, foregroundColor: Colors.black),
                  child: const Text('Confirm Sale'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Deal #${deal.id}',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Transaction>>(
          stream: db.watchDealTransactions(deal.id),
          builder: (context, snapshotTx) {
            final txList = snapshotTx.data ?? [];

            double additionalExpenses = 0.0;
            double totalSalesRevenue = 0.0;

            for (final tx in txList) {
              if (tx.direction == 'Outflow') {
                additionalExpenses += tx.amount;
              } else if (tx.direction == 'Inflow') {
                totalSalesRevenue += tx.amount;
              }
            }

            final totalInvestment = deal.purchaseAmount + additionalExpenses;
            final netProfit = totalSalesRevenue - totalInvestment;

            return StreamBuilder<List<VehicleComponent>>(
              stream: db.watchDealComponents(deal.vehicleId),
              builder: (context, snapshotComp) {
                final components = snapshotComp.data ?? [];
                final unsoldCount = components.where((c) => c.status == 'Unsold').length;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF334155)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Investment', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                                Text('₹${totalInvestment.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Sales Revenue', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                                Text('₹${totalSalesRevenue.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                            const Divider(color: Color(0xFF334155), height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Net Profit / Loss', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                Text(
                                  '₹${netProfit.toStringAsFixed(2)}',
                                  style: GoogleFonts.outfit(color: netProfit >= 0 ? Colors.amber.shade400 : Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'COMPONENTS DISMANTLED ($unsoldCount UNSOLD)',
                            style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      if (components.isEmpty)
                        const Text('No components registered.', style: TextStyle(color: Color(0xFF94A3B8)))
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: components.map((comp) {
                            final isSold = comp.status == 'Sold';
                            return InkWell(
                              onTap: isSold ? null : () => _showSellComponentDialog(context, ref, comp),
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSold ? Colors.green.withValues(alpha: 0.15) : const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: isSold ? Colors.greenAccent : const Color(0xFF334155)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      isSold ? LucideIcons.checkCircle2 : LucideIcons.package,
                                      size: 16,
                                      color: isSold ? Colors.greenAccent : Colors.amber.shade400,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${comp.componentType} (${comp.status})',
                                      style: GoogleFonts.inter(
                                        color: isSold ? Colors.greenAccent : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DEAL TIMELINE & SALES',
                            style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => const RecordTransactionSheet(initialDirection: 'Outflow'),
                              );
                            },
                            icon: const Icon(LucideIcons.plus, size: 14),
                            label: const Text('+ Expense'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber.shade500,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      if (txList.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFF334155)),
                          ),
                          child: Center(
                            child: Text('No expenses or part sales recorded yet.', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: txList.length,
                          itemBuilder: (ctx, idx) {
                            final tx = txList[idx];
                            final isInflow = tx.direction == 'Inflow';

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E293B),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFF334155)),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  isInflow ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
                                  color: isInflow ? Colors.greenAccent : Colors.redAccent,
                                ),
                                title: Text(isInflow ? 'Part Sale' : 'Deal Expense', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                                subtitle: Text(DateFormat('dd MMM, hh:mm a').format(tx.date), style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                                trailing: Text(
                                  '${isInflow ? '+' : '-'} ₹${tx.amount.toStringAsFixed(2)}',
                                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: isInflow ? Colors.greenAccent : Colors.redAccent),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
