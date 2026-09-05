import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers.dart';
import '../reports/reports_dashboard_screen.dart';
import 'import_export_screen.dart';
import 'pin_lock_screen.dart';
import 'audit_log_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final user = authService.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Settings & Tools',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
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
                    backgroundColor: Colors.amber.shade500.withValues(alpha: 0.2),
                    child: Icon(LucideIcons.user, color: Colors.amber.shade400),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'Owner',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          user?.email ?? 'Not logged in',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      authService.signOut();
                    },
                    icon: const Icon(LucideIcons.logOut, size: 16, color: Colors.redAccent),
                    label: const Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'REPORTS & ANALYTICS',
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 8),
            _buildSettingsTile(
              icon: LucideIcons.lineChart,
              title: 'Reports Dashboard',
              subtitle: 'P&L statements, trip profitability, & receivables',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportsDashboardScreen()));
              },
            ),

            const SizedBox(height: 24),
            Text(
              'SECURITY & AUDIT',
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 8),
            _buildSettingsTile(
              icon: LucideIcons.lock,
              title: 'Set App Lock PIN',
              subtitle: 'Require 4-digit PIN when opening app',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PinLockScreen(isSetupMode: true)));
              },
            ),
            _buildSettingsTile(
              icon: LucideIcons.shieldCheck,
              title: 'Financial Audit Trail Logs',
              subtitle: 'View complete log of database creation & changes',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AuditLogScreen()));
              },
            ),

            const SizedBox(height: 24),
            Text(
              'DATA & BACKUP',
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 8),
            _buildSettingsTile(
              icon: LucideIcons.uploadCloud,
              title: 'Google Account Cloud Backup',
              subtitle: 'Auto-synced to ${user?.email ?? 'Google Account'}',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ImportExportScreen()));
              },
            ),
            _buildSettingsTile(
              icon: LucideIcons.fileSpreadsheet,
              title: 'Excel Reports Export & Import',
              subtitle: 'Export transactions, ledgers, & P&L to .xlsx',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ImportExportScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.amber.shade400),
        title: Text(title, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
        trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
        onTap: onTap,
      ),
    );
  }
}
