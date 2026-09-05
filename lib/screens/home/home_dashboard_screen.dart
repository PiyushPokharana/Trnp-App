import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';
import '../transport/create_trip_screen.dart';
import '../transport/trip_detail_screen.dart';
import '../trading/create_deal_screen.dart';
import '../trading/deal_detail_screen.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final company = ref.watch(selectedCompanyProvider);
    final transactionsAsync = ref.watch(recentTransactionsStreamProvider);
    final tripsAsync = ref.watch(tripsStreamProvider);
    final dealsAsync = ref.watch(dealsStreamProvider);

    final isTransport = company?.businessType == 'Transport';

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

                  if (isTransport) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ACTIVE TRIPS',
                          style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTripScreen()));
                          },
                          icon: const Icon(LucideIcons.plus, size: 14, color: Colors.amber),
                          label: Text('+ Start Trip', style: TextStyle(color: Colors.amber.shade400, fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    tripsAsync.when(
                      data: (trips) {
                        if (trips.isEmpty) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF334155))),
                            child: Row(
                              children: [
                                const Icon(LucideIcons.truck, color: Color(0xFF64748B)),
                                const SizedBox(width: 12),
                                Expanded(child: Text('No active trips running. Tap "+ Start Trip"', style: GoogleFonts.inter(color: const Color(0xFF94A3B8)))),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: trips.length,
                          itemBuilder: (ctx, idx) {
                            final trip = trips[idx];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF334155))),
                              child: ListTile(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TripDetailScreen(trip: trip))),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(LucideIcons.truck, color: Colors.blueAccent),
                                ),
                                title: Text('Trip #${trip.id} (${trip.status})', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                                subtitle: Text('${trip.origin ?? 'Origin'} → ${trip.destination ?? 'Destination'}', style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                                trailing: Text('₹${trip.freightAmount.toStringAsFixed(0)}', style: GoogleFonts.outfit(color: Colors.amber.shade400, fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (_, __) => const SizedBox(),
                    ),
                  ] else ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ACTIVE TRUCK PURCHASES / DEALS',
                          style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateDealScreen()));
                          },
                          icon: const Icon(LucideIcons.plus, size: 14, color: Colors.amber),
                          label: Text('+ New Deal', style: TextStyle(color: Colors.amber.shade400, fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    dealsAsync.when(
                      data: (deals) {
                        if (deals.isEmpty) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF334155))),
                            child: Row(
                              children: [
                                const Icon(LucideIcons.wrench, color: Color(0xFF64748B)),
                                const SizedBox(width: 12),
                                Expanded(child: Text('No active deals registered. Tap "+ New Deal"', style: GoogleFonts.inter(color: const Color(0xFF94A3B8)))),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: deals.length,
                          itemBuilder: (ctx, idx) {
                            final deal = deals[idx];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF334155))),
                              child: ListTile(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DealDetailScreen(deal: deal))),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: const Color(0xFF10B981).withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(LucideIcons.wrench, color: Color(0xFF34D399)),
                                ),
                                title: Text('Deal #${deal.id} (${deal.dealType})', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                                subtitle: Text('Purchased for ₹${deal.purchaseAmount.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                                trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (_, __) => const SizedBox(),
                    ),
                  ],

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'RECENT ACTIVITY FEED',
                        style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
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
                            style: GoogleFonts.outfit(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tap the yellow "+" button below to record your first entry',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
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
                style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: GoogleFonts.outfit(fontSize: isFullWidth ? 24 : 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
