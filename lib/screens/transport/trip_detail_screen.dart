import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../providers.dart';
import '../transaction/record_transaction_sheet.dart';

class TripDetailScreen extends ConsumerWidget {
  final Trip trip;

  const TripDetailScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Trip #${trip.id}',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(LucideIcons.moreVertical, color: Colors.white),
            color: const Color(0xFF1E293B),
            onSelected: (status) async {
              await db.updateTripStatus(trip.id, status);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Trip status updated to $status'), backgroundColor: Colors.green),
                );
              }
            },
            itemBuilder: (ctx) => const [
              PopupMenuItem(value: 'Active', child: Text('Mark Active', style: TextStyle(color: Colors.white))),
              PopupMenuItem(value: 'Delivered', child: Text('Mark Delivered', style: TextStyle(color: Colors.white))),
              PopupMenuItem(value: 'Closed', child: Text('Close Trip (Fully Paid)', style: TextStyle(color: Colors.white))),
              PopupMenuItem(value: 'Cancelled', child: Text('Cancel Trip', style: TextStyle(color: Colors.redAccent))),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Transaction>>(
          stream: db.watchTripTransactions(trip.id),
          builder: (context, snapshot) {
            final txList = snapshot.data ?? [];
            
            double totalExpenses = 0.0;
            double amountReceived = 0.0;

            for (final tx in txList) {
              if (tx.direction == 'Outflow') {
                totalExpenses += tx.amount;
              } else if (tx.direction == 'Inflow') {
                amountReceived += tx.amount;
              }
            }

            final netProfit = trip.freightAmount - totalExpenses;
            final outstandingFreight = trip.freightAmount - amountReceived;

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${trip.origin ?? 'Origin'} → ${trip.destination ?? 'Destination'}',
                              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: trip.status == 'Closed'
                                    ? Colors.green.withValues(alpha: 0.2)
                                    : Colors.amber.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                trip.status,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: trip.status == 'Closed' ? Colors.greenAccent : Colors.amber.shade400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Material: ${trip.material ?? 'Freight Cargo'}',
                          style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryTile('Freight Rate', '₹${trip.freightAmount.toStringAsFixed(2)}', Colors.blueAccent),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSummaryTile('Trip Expenses', '₹${totalExpenses.toStringAsFixed(2)}', Colors.redAccent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryTile('Net Trip Profit', '₹${netProfit.toStringAsFixed(2)}', netProfit >= 0 ? Colors.amber : Colors.redAccent),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSummaryTile('Outstanding', '₹${outstandingFreight.toStringAsFixed(2)}', outstandingFreight > 0 ? Colors.amber.shade400 : Colors.greenAccent),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TRIP TIMELINE & EXPENSES',
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
                        label: const Text('+ Entry'),
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
                        child: Text(
                          'No expenses or payments recorded for this trip yet.',
                          style: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                        ),
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
                            title: Text('${isInflow ? 'Received' : 'Paid'} • ${tx.paymentMethod}', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
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
        ),
      ),
    );
  }

  Widget _buildSummaryTile(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8))),
          const SizedBox(height: 6),
          Text(value, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
