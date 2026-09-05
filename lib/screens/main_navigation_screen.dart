import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'home/home_dashboard_screen.dart';
import 'history/history_screen.dart';
import 'master/master_directory_screen.dart';
import 'settings/settings_screen.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeDashboardScreen(),
    HistoryScreen(),
    MasterDirectoryScreen(),
    SettingsScreen(),
  ];

  void _showRecordTransactionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Record New Entry',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(LucideIcons.minusCircle, color: Colors.redAccent),
                ),
                title: Text('Money Paid / Expense', style: GoogleFonts.outfit(color: Colors.white)),
                subtitle: const Text('Diesel, Toll, Repair, Labour, Advance', style: TextStyle(color: Color(0xFF94A3B8))),
                onTap: () {
                  Navigator.pop(ctx);
                },
              ),
              const Divider(color: Color(0xFF334155)),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(LucideIcons.plusCircle, color: Colors.greenAccent),
                ),
                title: Text('Money Received / Income', style: GoogleFonts.outfit(color: Colors.white)),
                subtitle: const Text('Freight Income, Part Sale, Payment Received', style: TextStyle(color: Color(0xFF94A3B8))),
                onTap: () {
                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showRecordTransactionModal,
        backgroundColor: Colors.amber.shade500,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(LucideIcons.plus, size: 30, color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E293B),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: LucideIcons.layoutDashboard, label: 'Home', index: 0),
            _buildNavItem(icon: LucideIcons.history, label: 'History', index: 1),
            const SizedBox(width: 48),
            _buildNavItem(icon: LucideIcons.users, label: 'Directory', index: 2),
            _buildNavItem(icon: LucideIcons.settings, label: 'Settings', index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? Colors.amber.shade400 : const Color(0xFF94A3B8);

    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
