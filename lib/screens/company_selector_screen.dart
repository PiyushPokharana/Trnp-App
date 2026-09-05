import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../providers.dart';
import 'main_navigation_screen.dart';

class CompanySelectorScreen extends ConsumerWidget {
  const CompanySelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companiesAsync = ref.watch(companiesStreamProvider);
    final userSession = ref.watch(authServiceProvider).currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Businesses',
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut, color: Color(0xFF94A3B8)),
            tooltip: 'Sign Out',
            onPressed: () {
              ref.read(authServiceProvider).signOut();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(14),
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
                            userSession?.displayName ?? 'Owner',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            userSession?.email ?? 'Logged In',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (userSession?.isDevMode ?? false)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade500.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'DEV',
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade400,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'SELECT BUSINESS CONTEXT',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 12),

              Expanded(
                child: companiesAsync.when(
                  data: (companies) {
                    if (companies.isEmpty) {
                      return const Center(
                        child: Text(
                          'No business setup found.',
                          style: TextStyle(color: Color(0xFF94A3B8)),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        final company = companies[index];
                        final isTransport = company.businessType == 'Transport';

                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              ref.read(selectedCompanyProvider.notifier).state = company;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainNavigationScreen(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Ink(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E293B),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isTransport
                                      ? Colors.blueAccent.withValues(alpha: 0.4)
                                      : const Color(0xFF10B981).withValues(alpha: 0.4),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: isTransport
                                          ? Colors.blue.withValues(alpha: 0.15)
                                          : const Color(0xFF10B981).withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      isTransport ? LucideIcons.truck : LucideIcons.wrench,
                                      size: 32,
                                      color: isTransport
                                          ? Colors.blueAccent.shade100
                                          : const Color(0xFF34D399),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          company.name,
                                          style: GoogleFonts.outfit(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          isTransport
                                              ? 'Trips • Freight • Drivers • Routes'
                                              : 'Truck Purchases • Scrapping • Part Sales',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            color: const Color(0xFF94A3B8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    LucideIcons.chevronRight,
                                    color: Color(0xFF64748B),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  ),
                  error: (err, stack) => Center(
                    child: Text('Error loading companies: $err',
                        style: const TextStyle(color: Colors.redAccent)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
