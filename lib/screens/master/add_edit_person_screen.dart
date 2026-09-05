import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../providers.dart';

class AddEditPersonScreen extends ConsumerStatefulWidget {
  const AddEditPersonScreen({super.key});

  @override
  ConsumerState<AddEditPersonScreen> createState() => _AddEditPersonScreenState();
}

class _AddEditPersonScreenState extends ConsumerState<AddEditPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  final List<String> _availableRoles = [
    'Customer',
    'Driver',
    'Mechanic',
    'Scrap Dealer',
    'Buyer',
    'Seller',
    'Supplier',
    'Broker',
    'Employee',
    'Other'
  ];
  final Set<String> _selectedRoles = {'Customer'};
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _savePerson() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      await db.insertPersonWithRoles(
        PeopleCompanion.insert(
          name: _nameController.text.trim(),
          phone: drift.Value(_phoneController.text.trim().isEmpty ? null : _phoneController.text.trim()),
          notes: drift.Value(_notesController.text.trim().isEmpty ? null : _notesController.text.trim()),
        ),
        _selectedRoles.toList(),
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Contact "${_nameController.text.trim()}" added successfully.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving contact: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Add New Person / Contact',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
                // Person Name
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Name is required' : null,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(LucideIcons.user, color: Color(0xFF94A3B8)),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF334155)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Phone Number
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(LucideIcons.phone, color: Color(0xFF94A3B8)),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF334155)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Multi-Role Selection Tags
                Text(
                  'SELECT ROLE(S)',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _availableRoles.map((role) {
                    final isSelected = _selectedRoles.contains(role);
                    return FilterChip(
                      selected: isSelected,
                      label: Text(role),
                      labelStyle: GoogleFonts.inter(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      selectedColor: Colors.amber.shade400,
                      backgroundColor: const Color(0xFF1E293B),
                      side: BorderSide(
                        color: isSelected ? Colors.amber.shade400 : const Color(0xFF334155),
                      ),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedRoles.add(role);
                          } else {
                            if (_selectedRoles.length > 1) {
                              _selectedRoles.remove(role);
                            }
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),
                // Notes
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Notes / Remarks (Optional)',
                    labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(LucideIcons.fileText, color: Color(0xFF94A3B8)),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF334155)),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                ElevatedButton.icon(
                  onPressed: _isSaving ? null : _savePerson,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                        )
                      : const Icon(LucideIcons.check, color: Colors.black),
                  label: Text(
                    'Save Contact',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade500,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
