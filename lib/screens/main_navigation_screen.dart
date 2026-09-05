import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'home/home_dashboard_screen.dart';
import 'history/history_screen.dart';
import 'master/master_directory_screen.dart';
import 'settings/settings_screen.dart';
import 'transaction/record_transaction_sheet.dart';

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
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const RecordTransactionSheet(initialDirection: 'Outflow');
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
