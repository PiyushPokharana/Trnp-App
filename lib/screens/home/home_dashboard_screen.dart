import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final company = ref.watch(selectedCompanyProvider);
    final transactionsAsync = ref.watch(recentTransactionsStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company?.name ?? 'All Businesses',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Today\'s Snapshot & Activity',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.arrowLeftRight, color: Colors.amber),
            tooltip: 'Switch Business',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: transactionsAsync.when(
          data: (txList) {
            double moneyIn = 0.0;
            double moneyOut = 0.0;

            for (final tx in txList) {
              if (tx.direction == 'Inflow') {
                moneyIn += tx.amount;
              } else if (tx.direction == 'Outflow') {
                moneyOut += tx.amount;
              }
            }
            final netProfit = moneyIn - moneyOut;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // KPI Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildKpiCard(
                          title: 'Money In (Month)',
                          amount: '₹${moneyIn.toStringAsFixed(2)}',
                          icon: LucideIcons.arrowDownLeft,
                          color: Colors.greenAccent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildKpiCard(
                          title: 'Money Out (Month)',
                          amount: '₹${moneyOut.toStringAsFixed(2)}',
                          icon: LucideIcons.arrowUpRight,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildKpiCard(
                    title: 'Estimated Net Profit',
                    amount: '₹${netProfit.toStringAsFixed(2)}',
                    icon: LucideIcons.trendingUp,
                    color: netProfit >= 0 ? Colors.amber : Colors.redAccent,
                    isFullWidth: true,
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'RECENT ACTIVITY FEED',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All', style: TextStyle(color: Colors.amber.shade400)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  if (txList.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFF334155)),
                      ),
                      child: Column(
                        children: [
                          const Icon(LucideIcons.bookOpen, size: 48, color: Color(0xFF64748B)),
                          const SizedBox(height: 12),
                          Text(
                            'No transactions recorded today',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tap the yellow "+" button below to record your first entry',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: txList.length,
                      itemBuilder: (context, index) {
                        final tx = txList[index];
                        final isInflow = tx.direction == 'Inflow';

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFF334155)),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: isInflow ? Colors.green.withValues(alpha: 0.15) : Colors.red.withValues(alpha: 0.15),
                              child: Icon(
                                isInflow ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
                                color: isInflow ? Colors.greenAccent : Colors.redAccent,
                              ),
                            ),
                            title: Text(
                              '${isInflow ? 'Received' : 'Paid'} • ${tx.paymentMethod}',
                              style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              DateFormat('dd MMM yyyy, hh:mm a').format(tx.date),
                              style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12),
                            ),
                            trailing: Text(
                              '${isInflow ? '+' : '-'} ₹${tx.amount.toStringAsFixed(2)}',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isInflow ? Colors.greenAccent : Colors.redAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(color: Colors.amber)),
          error: (err, stack) => Center(child: Text('Error loading dashboard: $err', style: const TextStyle(color: Colors.redAccent))),
        ),
      ),
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
    bool isFullWidth = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: GoogleFonts.outfit(
              fontSize: isFullWidth ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
