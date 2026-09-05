import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers.dart';
import 'add_edit_person_screen.dart';
import 'add_edit_vehicle_screen.dart';

class MasterDirectoryScreen extends ConsumerStatefulWidget {
  const MasterDirectoryScreen({super.key});

  @override
  ConsumerState<MasterDirectoryScreen> createState() => _MasterDirectoryScreenState();
}

class _MasterDirectoryScreenState extends ConsumerState<MasterDirectoryScreen> {
  int _selectedToggle = 0; // 0 = People, 1 = Vehicles
  final _searchController = TextEditingController();

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
          'Master Directory',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Toggle Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF334155)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedToggle = 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedToggle == 0 ? Colors.amber.shade500 : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'People / Contacts',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              color: _selectedToggle == 0 ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedToggle = 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedToggle == 1 ? Colors.amber.shade500 : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Vehicles / Trucks',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              color: _selectedToggle == 1 ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Directory Content Lists
            Expanded(
              child: _selectedToggle == 0
                  ? _buildPeopleTab(peopleAsync)
                  : _buildVehiclesTab(vehiclesAsync),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_selectedToggle == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddEditPersonScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddEditVehicleScreen()),
            );
          }
        },
        backgroundColor: Colors.amber.shade500,
        foregroundColor: Colors.black,
        icon: const Icon(LucideIcons.plus, size: 20),
        label: Text(
          _selectedToggle == 0 ? 'Add Person' : 'Add Vehicle',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPeopleTab(AsyncValue peopleAsync) {
    return peopleAsync.when(
      data: (peopleList) {
        if (peopleList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(LucideIcons.users, size: 56, color: Color(0xFF64748B)),
                const SizedBox(height: 12),
                Text(
                  'No contacts added yet',
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text('Tap "+ Add Person" below to record a customer or driver', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: peopleList.length,
          itemBuilder: (context, index) {
            final person = peopleList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade500.withValues(alpha: 0.15),
                  child: Icon(LucideIcons.user, color: Colors.amber.shade400),
                ),
                title: Text(person.name, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(person.phone ?? 'No phone added', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
                trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.amber)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.redAccent))),
    );
  }

  Widget _buildVehiclesTab(AsyncValue vehiclesAsync) {
    return vehiclesAsync.when(
      data: (vehiclesList) {
        if (vehiclesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(LucideIcons.truck, size: 56, color: Color(0xFF64748B)),
                const SizedBox(height: 12),
                Text(
                  'No vehicles registered yet',
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text('Tap "+ Add Vehicle" below to add a truck', style: GoogleFonts.inter(color: const Color(0xFF94A3B8))),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: vehiclesList.length,
          itemBuilder: (context, index) {
            final vehicle = vehiclesList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(LucideIcons.truck, color: Colors.blueAccent),
                ),
                title: Text(vehicle.regNumber, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text('${vehicle.make ?? ''} ${vehicle.model ?? ''} • Status: ${vehicle.status}',
                    style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
                trailing: const Icon(LucideIcons.chevronRight, color: Color(0xFF64748B)),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.amber)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.redAccent))),
    );
  }
}
