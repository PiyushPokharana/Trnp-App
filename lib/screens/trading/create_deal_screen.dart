import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../providers.dart';

class CreateDealScreen extends ConsumerStatefulWidget {
  const CreateDealScreen({super.key});

  @override
  ConsumerState<CreateDealScreen> createState() => _CreateDealScreenState();
}

class _CreateDealScreenState extends ConsumerState<CreateDealScreen> {
  final _formKey = GlobalKey<FormState>();
  PeopleData? _selectedSeller;

  final _regNumberController = TextEditingController();
  final _makeModelController = TextEditingController();
  final _purchasePriceController = TextEditingController();

  String _dealType = 'Scrap';
  final Set<String> _selectedComponents = {'Engine', 'Body', 'Cabin', 'Tyres'};
  final List<String> _allComponents = ['Engine', 'Body', 'Cabin', 'Tyres', 'Chassis', 'Gearbox', 'Other'];

  bool _isSaving = false;

  @override
  void dispose() {
    _regNumberController.dispose();
    _makeModelController.dispose();
    _purchasePriceController.dispose();
    super.dispose();
  }

  Future<void> _saveDeal() async {
    if (!_formKey.currentState!.validate()) return;
    final company = ref.read(selectedCompanyProvider);
    if (company == null) return;

    final price = double.tryParse(_purchasePriceController.text.trim()) ?? 0.0;
    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);

      // 1. Create Vehicle Record
      final vehicleId = await db.insertVehicle(
        VehiclesCompanion.insert(
          companyId: company.id,
          regNumber: _regNumberController.text.trim().toUpperCase(),
          make: drift.Value(_makeModelController.text.trim()),
          purchasePrice: drift.Value(price),
          status: 'Dismantling',
          businessContext: 'Trading',
        ),
      );

      // 2. Create Deal Record & Component Rows
      final dealId = await db.insertDealWithComponents(
        TruckDealsCompanion.insert(
          companyId: company.id,
          vehicleId: vehicleId,
          sellerPersonId: drift.Value(_selectedSeller?.id),
          dealType: _dealType,
          purchaseAmount: drift.Value(price),
          purchaseDate: DateTime.now(),
          status: const drift.Value('Purchased'),
        ),
        _selectedComponents.toList(),
      );

      if (mounted) {
        Navigator.pop(context, dealId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Truck Purchase Deal registered!'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error registering deal: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final peopleAsync = ref.watch(peopleStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Register Purchase Deal',
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
                // Seller Selector
                peopleAsync.when(
                  data: (people) {
                    return DropdownButtonFormField<PeopleData>(
                      value: _selectedSeller,
                      dropdownColor: const Color(0xFF1E293B),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Seller / Owner (Optional)',
                        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                        prefixIcon: const Icon(LucideIcons.user, color: Color(0xFF94A3B8)),
                        filled: true,
                        fillColor: const Color(0xFF1E293B),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                      ),
                      items: people.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                      onChanged: (val) => setState(() => _selectedSeller = val),
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
                const SizedBox(height: 16),

                // Vehicle Reg Number
                TextFormField(
                  controller: _regNumberController,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(color: Colors.white),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Truck number is required' : null,
                  decoration: InputDecoration(
                    labelText: 'Truck Registration / Identifier *',
                    labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(LucideIcons.truck, color: Color(0xFF94A3B8)),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                  ),
                ),
                const SizedBox(height: 16),

                // Purchase Price & Deal Type Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _purchasePriceController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: Colors.white),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Price required' : null,
                        decoration: InputDecoration(
                          labelText: 'Purchase Price (₹) *',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _dealType,
                        dropdownColor: const Color(0xFF1E293B),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Deal Type',
                          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF334155))),
                        ),
                        items: ['Scrap', 'Resale'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _dealType = val);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Component Checklist Header
                Text(
                  'COMPONENTS FOR DISMANTLING / PART SALES',
                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _allComponents.map((comp) {
                    final isSelected = _selectedComponents.contains(comp);
                    return FilterChip(
                      selected: isSelected,
                      label: Text(comp),
                      labelStyle: GoogleFonts.inter(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      selectedColor: Colors.amber.shade400,
                      backgroundColor: const Color(0xFF1E293B),
                      side: BorderSide(color: isSelected ? Colors.amber.shade400 : const Color(0xFF334155)),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedComponents.add(comp);
                          } else {
                            if (_selectedComponents.length > 1) {
                              _selectedComponents.remove(comp);
                            }
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 32),

                ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveDeal,
                  icon: _isSaving
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                      : const Icon(LucideIcons.check, color: Colors.black),
                  label: Text('Save Purchase Deal', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
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
