import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../providers.dart';

class AddCategoryDialog extends ConsumerStatefulWidget {
  final String direction; // Inflow or Outflow

  const AddCategoryDialog({super.key, required this.direction});

  @override
  ConsumerState<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends ConsumerState<AddCategoryDialog> {
  final _nameController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveCategory() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isSaving = true);
    try {
      final db = ref.read(databaseProvider);
      final company = ref.read(selectedCompanyProvider);

      await db.insertCategory(
        TransactionCategoriesCompanion.insert(
          name: name,
          direction: widget.direction,
          scopeCompanyId: drift.Value(company?.id),
          isUserCreated: const drift.Value(true),
        ),
      );

      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding category: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1E293B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Add New Category (${widget.direction})',
        style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      content: TextField(
        controller: _nameController,
        autofocus: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Category Name (e.g. Tyre Repair)',
          labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
          filled: true,
          fillColor: const Color(0xFF0F172A),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Color(0xFF94A3B8))),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _saveCategory,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade500, foregroundColor: Colors.black),
          child: const Text('Save Category'),
        ),
      ],
    );
  }
}
