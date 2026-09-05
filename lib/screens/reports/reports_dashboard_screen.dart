import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers.dart';

class ReportsDashboardScreen extends ConsumerWidget {
  const ReportsDashboardScreen({super.key});

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
        title: Text(
          'Reports & Analytics',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Text('Executive Summary', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('Business performance for ${company?.name ?? 'Company'}', style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text('AVAILABLE REPORTS', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8))),
              const SizedBox(height: 12),

              _buildReportCard(
                title: 'Monthly P&L Statement',
                subtitle: 'Combined revenue, direct costs, and net profit',
                icon: LucideIcons.trendingUp,
                color: Colors.amber,
                onTap: () {
                  _showReportDetails(context, 'Monthly P&L Statement', transactionsAsync.value ?? []);
                },
              ),

              if (isTransport)
                _buildReportCard(
                  title: 'Trip Profitability Summary',
                  subtitle: 'Freight rate vs diesel, toll, & repair expenses per trip',
                  icon: LucideIcons.truck,
                  color: Colors.blueAccent,
                  onTap: () {
                    _showTripReport(context, tripsAsync.value ?? []);
                  },
                )
              else
                _buildReportCard(
                  title: 'Deal & Part Sales ROI',
                  subtitle: 'Truck purchase cost vs sum of component sales',
                  icon: LucideIcons.wrench,
                  color: const Color(0xFF34D399),
                  onTap: () {
                    _showDealReport(context, dealsAsync.value ?? []);
                  },
                ),

              _buildReportCard(
                title: 'Customer Receivables Ledger',
                subtitle: 'Outstanding freight & payment pending per party',
                icon: LucideIcons.users,
                color: Colors.purpleAccent,
                onTap: () {},
              ),

              _buildReportCard(
                title: 'Vehicle Operating Expense Breakdown',
                subtitle: 'Diesel, toll, & repair expenditures grouped per truck',
                icon: LucideIcons.barChart2,
                color: Colors.orangeAccent,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
        trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
      ),
    );
  }

  void _showReportDetails(BuildContext context, String title, List txList) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              Text('Total records analyzed: ${txList.length}', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
            ],
          ),
        );
      },
    );
  }

  void _showTripReport(BuildContext context, List trips) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Trip Profitability Summary', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              Text('Total trips recorded: ${trips.length}', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
            ],
          ),
        );
      },
    );
  }

  void _showDealReport(BuildContext context, List deals) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Truck Deal ROI Report', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              Text('Total deals recorded: ${deals.length}', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
            ],
          ),
        );
      },
    );
  }
}
