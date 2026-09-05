import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers.dart';
import 'vehicle_profile_screen.dart';
import 'person_profile_screen.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final peopleAsync = ref.watch(peopleStreamProvider);
    final vehiclesAsync = ref.watch(vehiclesStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'History & Global Search',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Input Bar
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                onChanged: (val) {
                  setState(() => _searchQuery = val.trim().toLowerCase());
                },
                decoration: InputDecoration(
                  hintText: 'Search truck no (e.g. RJ14), person, category...',
                  hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                  prefixIcon: const Icon(LucideIcons.search, color: Color(0xFF94A3B8)),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(LucideIcons.x, color: Color(0xFF94A3B8)),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: const Color(0xFF1E293B),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFF334155)),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: _searchQuery.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(LucideIcons.history, size: 56, color: Color(0xFF64748B)),
                            const SizedBox(height: 12),
                            Text(
                              'Universal Search',
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Type a vehicle registration number or contact name above',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: const Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          // Matching Vehicles Section
                          vehiclesAsync.when(
                            data: (vehicles) {
                              final matches = vehicles
                                  .where((v) =>
                                      v.regNumber.toLowerCase().contains(_searchQuery) ||
                                      (v.make ?? '').toLowerCase().contains(_searchQuery) ||
                                      (v.model ?? '').toLowerCase().contains(_searchQuery))
                                  .toList();

                              if (matches.isEmpty) return const SizedBox();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('MATCHING VEHICLES (${matches.length})',
                                      style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8), letterSpacing: 1.2)),
                                  const SizedBox(height: 8),
                                  ...matches.map((v) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF334155))),
                                      child: ListTile(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VehicleProfileScreen(vehicle: v))),
                                        leading: const Icon(LucideIcons.truck, color: Colors.blueAccent),
                                        title: Text(v.regNumber, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                                        subtitle: Text('${v.make ?? ''} ${v.model ?? ''} • Status: ${v.status}', style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                                        trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 16),
                                ],
                              );
                            },
                            loading: () => const SizedBox(),
                            error: (_, __) => const SizedBox(),
                          ),

                          // Matching Contacts Section
                          peopleAsync.when(
                            data: (people) {
                              final matches = people
                                  .where((p) =>
                                      p.name.toLowerCase().contains(_searchQuery) ||
                                      (p.phone ?? '').toLowerCase().contains(_searchQuery))
                                  .toList();

                              if (matches.isEmpty) return const SizedBox();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('MATCHING CONTACTS (${matches.length})',
                                      style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8), letterSpacing: 1.2)),
                                  const SizedBox(height: 8),
                                  ...matches.map((p) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF334155))),
                                      child: ListTile(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PersonProfileScreen(person: p))),
                                        leading: const Icon(LucideIcons.user, color: Colors.amber),
                                        title: Text(p.name, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                                        subtitle: Text(p.phone ?? 'No phone added', style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                                        trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
                                      ),
                                    );
                                  }),
                                ],
                              );
                            },
                            loading: () => const SizedBox(),
                            error: (_, __) => const SizedBox(),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
