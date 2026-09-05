import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../providers.dart';

class CreateTripScreen extends ConsumerStatefulWidget {
  const CreateTripScreen({super.key});

  @override
  ConsumerState<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends ConsumerState<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  PeopleData? _selectedCustomer;
  Vehicle? _selectedVehicle;
  PeopleData? _selectedDriver;

  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  final _materialController = TextEditingController();
  final _freightRateController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    _materialController.dispose();
    _freightRateController.dispose();
    super.dispose();
  }

  Future<void> _saveTrip() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCustomer == null || _selectedVehicle == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Customer and Vehicle are required'), backgroundColor: Colors.amber),
      );
      return;
    }

    final company = ref.read(selectedCompanyProvider);
    if (company == null) return;

    final freight = double.tryParse(_freightRateController.text.trim()) ?? 0.0;
    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      final tripId = await db.insertTrip(
        TripsCompanion.insert(
          companyId: company.id,
          customerPersonId: _selectedCustomer!.id,
          vehicleId: _selectedVehicle!.id,
          driverPersonId: drift.Value(_selectedDriver?.id),
          origin: drift.Value(_originController.text.trim().isEmpty ? null : _originController.text.trim()),
          destination: drift.Value(_destinationController.text.trim().isEmpty ? null : _destinationController.text.trim()),
          material: drift.Value(_materialController.text.trim().isEmpty ? null : _materialController.text.trim()),
          freightAmount: drift.Value(freight),
          status: const drift.Value('Active'),
        ),
      );

      if (mounted) {
        Navigator.pop(context, tripId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New Trip created successfully!'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating trip: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
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
          'Start New Transport Trip',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Customer Selector Dropdown
                peopleAsync.when(
                  data: (people) {
                    return DropdownButtonFormField<PeopleData>(
                      value: _selectedCustomer,
                      dropdownColor: const Color(0xFF1E293B),
                      style: const TextStyle(color: Colors.white),
                      validator: (val) => val == null ? 'Customer is required' : null,
                      decoration: InputDecoration(
                        labelText: 'Customer / Party *',
                        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                        prefixIcon: const Icon(LucideIcons.user, color: Color(0xFF94A3B8)),
                        filled: true,
                        fillColor: const Color(0xFF1E293B),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                      ),
                      items: people.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                      onChanged: (val) => setState(() => _selectedCustomer = val),
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
                const SizedBox(height: 16),

                // Vehicle Selector Dropdown
                vehiclesAsync.when(
                  data: (vehicles) {
                    return DropdownButtonFormField<Vehicle>(
                      value: _selectedVehicle,
                      dropdownColor: const Color(0xFF1E293B),
                      style: const TextStyle(color: Colors.white),
                      validator: (val) => val == null ? 'Vehicle is required' : null,
                      decoration: InputDecoration(
                        labelText: 'Transport Truck *',
                        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                        prefixIcon: const Icon(LucideIcons.truck, color: Color(0xFF94A3B8)),
                        filled: true,
                        fillColor: const Color(0xFF1E293B),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                      ),
                      items: vehicles.map((v) => DropdownMenuItem(value: v, child: Text(v.regNumber))).toList(),
                      onChanged: (val) => setState(() => _selectedVehicle = val),
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
                const SizedBox(height: 16),

                // Driver Selector Dropdown (Optional)
                peopleAsync.when(
                  data: (people) {
                    return DropdownButtonFormField<PeopleData>(
                      value: _selectedDriver,
                      dropdownColor: const Color(0xFF1E293B),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Driver (Optional)',
                        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                        prefixIcon: const Icon(LucideIcons.userCheck, color: Color(0xFF94A3B8)),
                        filled: true,
                        fillColor: const Color(0xFF1E293B),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                      ),
                      items: people.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                      onChanged: (val) => setState(() => _selectedDriver = val),
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
                const SizedBox(height: 16),

                // Origin & Destination Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _originController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Origin / From',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _destinationController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Destination / To',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Material & Freight Rate Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _materialController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Material (e.g. Cement)',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _freightRateController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Freight Rate (₹)',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveTrip,
                  icon: _isSaving
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                      : const Icon(LucideIcons.check, color: Colors.black),
                  label: Text('Create Trip', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
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
        ),
      ),
    );
  }
}
