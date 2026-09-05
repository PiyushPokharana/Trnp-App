import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../providers.dart';

class VehicleProfileScreen extends ConsumerWidget {
  final Vehicle vehicle;

  const VehicleProfileScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          vehicle.regNumber,
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Transaction>>(
          stream: db.watchVehicleTimeline(vehicle.id),
          builder: (context, snapshot) {
            final txList = snapshot.data ?? [];

            double totalRevenue = 0.0;
            double totalExpenses = 0.0;

            for (final tx in txList) {
              if (tx.direction == 'Inflow') {
                totalRevenue += tx.amount;
              } else if (tx.direction == 'Outflow') {
                totalExpenses += tx.amount;
              }
            }

            final vehicleNetProfit = totalRevenue - totalExpenses - vehicle.purchasePrice;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Vehicle Header Card
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
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(LucideIcons.truck, size: 28, color: Colors.blueAccent),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vehicle.regNumber,
                                    style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Text(
                                    '${vehicle.make ?? ''} ${vehicle.model ?? ''} • Context: ${vehicle.businessContext}',
                                    style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Purchase Cost: ₹${vehicle.purchasePrice.toStringAsFixed(2)}', style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
                            Text('Status: ${vehicle.status}', style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amber.shade400)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Vehicle Lifetime Profit Card
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
                            Text('Lifetime Revenues', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                            Text('₹${totalRevenue.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lifetime Operating Expenses', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                            Text('₹${totalExpenses.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        const Divider(color: Color(0xFF334155), height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Vehicle Lifetime Net Profit', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(
                              '₹${vehicleNetProfit.toStringAsFixed(2)}',
                              style: GoogleFonts.outfit(color: vehicleNetProfit >= 0 ? Colors.amber.shade400 : Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'VEHICLE HISTORY & TIMELINE',
                    style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
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
                          'No history transactions recorded for this vehicle yet.',
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
                            title: Text(
                              '${isInflow ? 'Inflow' : 'Outflow'} • ${tx.paymentMethod}',
                              style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              DateFormat('dd MMM yyyy, hh:mm a').format(tx.date),
                              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
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
        ),
      ),
    );
  }
}
