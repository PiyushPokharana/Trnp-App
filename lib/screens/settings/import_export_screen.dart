import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers.dart';
import '../../services/excel_service.dart';

class ImportExportScreen extends ConsumerStatefulWidget {
  const ImportExportScreen({super.key});

  @override
  ConsumerState<ImportExportScreen> createState() => _ImportExportScreenState();
}

class _ImportExportScreenState extends ConsumerState<ImportExportScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _exportFullLedger() async {
    final company = ref.read(selectedCompanyProvider);
    final transactions = ref.read(recentTransactionsStreamProvider).value ?? [];

    if (transactions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No transactions recorded to export.'), backgroundColor: Colors.amber),
      );
      return;
    }

    setState(() => _isExporting = true);
    try {
      await ExcelService.exportTransactionsToExcel(
        companyName: company?.name ?? 'Business',
        transactions: transactions,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final company = ref.watch(selectedCompanyProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Import & Export Data',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber.shade400,
          labelColor: Colors.amber.shade400,
          unselectedLabelColor: const Color(0xFF94A3B8),
          tabs: const [
            Tab(text: 'Export Excel Reports'),
            Tab(text: 'Import Historical Data'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            // Export Tab
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        Text('Export Excel (.xlsx)', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text('Generate pre-formatted spreadsheet ledgers for accountants or offline backup.',
                            style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildReportOption(
                    title: 'Full Business Ledger',
                    subtitle: 'All inflows, outflows, reference numbers, & notes for ${company?.name ?? 'Company'}',
                    icon: LucideIcons.fileSpreadsheet,
                    onTap: _exportFullLedger,
                  ),

                  const Spacer(),

                  ElevatedButton.icon(
                    onPressed: _isExporting ? null : _exportFullLedger,
                    icon: _isExporting
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                        : const Icon(LucideIcons.share2, color: Colors.black),
                    label: Text('Export & Share .xlsx File', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade500,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),

            // Import Tab
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        Text('Import Backlog Data Wizard', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text('8-step wizard to map Excel/CSV columns (Date, Amount, Category, Contact) with deduplication.',
                            style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildStepTile(step: '1', title: 'Select File', subtitle: 'Choose your historical Excel (.xlsx) file'),
                  _buildStepTile(step: '2', title: 'Map Columns', subtitle: 'Match Excel columns to Date, Amount, Category, & Person'),
                  _buildStepTile(step: '3', title: 'Row Validation & Dedup', subtitle: 'Checks required fields and flags duplicate entries'),
                  _buildStepTile(step: '4', title: 'Confirm Import', subtitle: 'Safely imports clean rows into your database'),

                  const Spacer(),

                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Select an Excel file to start column mapping wizard.')),
                      );
                    },
                    icon: const Icon(LucideIcons.fileInput),
                    label: Text('Select Excel File to Import', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.amber.shade400,
                      side: BorderSide(color: Colors.amber.shade400),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportOption({
    required String title,
    required String subtitle,
    required IconData icon,
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
        leading: Icon(icon, color: Colors.amber.shade400),
        title: Text(title, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
        trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
        onTap: onTap,
      ),
    );
  }

  Widget _buildStepTile({required String step, required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.amber.shade500.withValues(alpha: 0.2),
            child: Text(step, style: GoogleFonts.outfit(color: Colors.amber.shade400, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
