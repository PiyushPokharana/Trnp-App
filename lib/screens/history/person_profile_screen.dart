import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../providers.dart';

class PersonProfileScreen extends ConsumerWidget {
  final PeopleData person;

  const PersonProfileScreen({super.key, required this.person});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          person.name,
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Transaction>>(
          stream: db.watchPersonTimeline(person.id),
          builder: (context, snapshot) {
            final txList = snapshot.data ?? [];

            double totalReceived = 0.0;
            double totalPaid = 0.0;

            for (final tx in txList) {
              if (tx.direction == 'Inflow') {
                totalReceived += tx.amount;
              } else if (tx.direction == 'Outflow') {
                totalPaid += tx.amount;
              }
            }

            final netBalance = totalReceived - totalPaid;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Contact Header Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF334155)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.amber.shade500.withValues(alpha: 0.2),
                          child: Icon(LucideIcons.user, size: 28, color: Colors.amber.shade400),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                person.name,
                                style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                person.phone ?? 'No phone number added',
                                style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Ledger Summary Cards
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
                            Text('Total Received (Inflows)', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                            Text('₹${totalReceived.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Paid (Outflows)', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 13)),
                            Text('₹${totalPaid.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        const Divider(color: Color(0xFF334155), height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Net Account Balance', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(
                              '₹${netBalance.toStringAsFixed(2)}',
                              style: GoogleFonts.outfit(color: netBalance >= 0 ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'FULL TRANSACTION LEDGER',
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
                          'No ledger entries found for this contact.',
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
                              '${isInflow ? 'Received' : 'Paid'} • ${tx.paymentMethod}',
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
