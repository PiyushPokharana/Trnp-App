import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../providers.dart';
import '../../widgets/attachment_picker_widget.dart';
import 'add_category_dialog.dart';

class RecordTransactionSheet extends ConsumerStatefulWidget {
  final String initialDirection; // Outflow or Inflow

  const RecordTransactionSheet({super.key, required this.initialDirection});

  @override
  ConsumerState<RecordTransactionSheet> createState() => _RecordTransactionSheetState();
}

class _RecordTransactionSheetState extends ConsumerState<RecordTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  late String _direction;
  
  TransactionCategory? _selectedCategory;
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  final _refNoController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  PaymentAccount? _selectedAccount;
  PeopleData? _selectedPerson;
  Vehicle? _selectedVehicle;
  File? _attachedBillPhoto;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _direction = widget.initialDirection;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    _refNoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.amber.shade500,
              surface: const Color(0xFF1E293B),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category'), backgroundColor: Colors.amber),
      );
      return;
    }

    final company = ref.read(selectedCompanyProvider);
    if (company == null) return;

    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount'), backgroundColor: Colors.amber),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      final user = ref.read(authServiceProvider).currentUser;

      final txId = await db.createTransaction(
        TransactionsCompanion.insert(
          companyId: company.id,
          categoryId: _selectedCategory!.id,
          date: _selectedDate,
          amount: amount,
          direction: _direction,
          paymentMethod: drift.Value(_selectedAccount?.type ?? 'Cash'),
          accountId: drift.Value(_selectedAccount?.id),
          personId: drift.Value(_selectedPerson?.id),
          vehicleId: drift.Value(_selectedVehicle?.id),
          notes: drift.Value(_notesController.text.trim().isEmpty ? null : _notesController.text.trim()),
          referenceNo: drift.Value(_refNoController.text.trim().isEmpty ? null : _refNoController.text.trim()),
          createdBy: drift.Value(user?.displayName ?? 'Owner'),
        ),
      );

      // Save attachment if bill photo captured
      if (_attachedBillPhoto != null) {
        await db.insertAttachment(
          AttachmentsCompanion.insert(
            transactionId: drift.Value(txId),
            fileUrl: _attachedBillPhoto!.path,
            fileType: const drift.Value('Image'),
          ),
        );
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_direction == 'Outflow' ? 'Expense' : 'Income'} of ₹${amount.toStringAsFixed(2)} recorded.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving record: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final peopleAsync = ref.watch(peopleStreamProvider);
    final vehiclesAsync = ref.watch(vehiclesStreamProvider);
    final accountsAsync = ref.watch(paymentAccountsStreamProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        top: 16,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => setState(() {
                        _direction = 'Outflow';
                        _selectedCategory = null;
                      }),
                      icon: const Icon(LucideIcons.arrowUpRight, size: 18),
                      label: const Text('Money Paid (Expense)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _direction == 'Outflow' ? Colors.redAccent : const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => setState(() {
                        _direction = 'Inflow';
                        _selectedCategory = null;
                      }),
                      icon: const Icon(LucideIcons.arrowDownLeft, size: 18),
                      label: const Text('Money Received (Income)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _direction == 'Inflow' ? Colors.green : const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                autofocus: true,
                style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Amount (₹) *',
                  labelStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                  prefixIcon: Icon(
                    LucideIcons.indianRupee,
                    size: 28,
                    color: _direction == 'Outflow' ? Colors.redAccent : Colors.greenAccent,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1E293B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF334155)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SELECT CATEGORY *',
                    style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: const Color(0xFF94A3B8)),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final added = await showDialog<bool>(
                        context: context,
                        builder: (_) => AddCategoryDialog(direction: _direction),
                      );
                      if (added == true) setState(() {});
                    },
                    icon: const Icon(LucideIcons.plus, size: 14, color: Colors.amber),
                    label: Text('+ Add New', style: TextStyle(color: Colors.amber.shade400, fontSize: 12)),
                  ),
                ],
              ),

              StreamBuilder<List<TransactionCategory>>(
                stream: db.watchCategories(_direction),
                builder: (context, snapshot) {
                  final categories = snapshot.data ?? [];
                  if (categories.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('No categories found.', style: TextStyle(color: Color(0xFF94A3B8))),
                    );
                  }

                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((cat) {
                      final isSelected = _selectedCategory?.id == cat.id;
                      return ChoiceChip(
                        selected: isSelected,
                        label: Text(cat.name),
                        labelStyle: GoogleFonts.inter(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        selectedColor: Colors.amber.shade400,
                        backgroundColor: const Color(0xFF1E293B),
                        side: BorderSide(color: isSelected ? Colors.amber.shade400 : const Color(0xFF334155)),
                        onSelected: (selected) {
                          if (selected) setState(() => _selectedCategory = cat);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF334155)),
                        ),
                        child: Row(
                          children: [
                            const Icon(LucideIcons.calendar, size: 18, color: Color(0xFF94A3B8)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                DateFormat('dd MMM yyyy').format(_selectedDate),
                                style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: accountsAsync.when(
                      data: (accounts) {
                        if (_selectedAccount == null && accounts.isNotEmpty) {
                          _selectedAccount = accounts.first;
                        }
                        return DropdownButtonFormField<PaymentAccount>(
                          value: _selectedAccount,
                          dropdownColor: const Color(0xFF1E293B),
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          decoration: InputDecoration(
                            labelText: 'Account',
                            labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                            filled: true,
                            fillColor: const Color(0xFF1E293B),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF334155)),
                            ),
                          ),
                          items: accounts.map((acc) {
                            return DropdownMenuItem(value: acc, child: Text(acc.name, overflow: TextOverflow.ellipsis));
                          }).toList(),
                          onChanged: (val) => setState(() => _selectedAccount = val),
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (_, __) => const SizedBox(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              peopleAsync.when(
                data: (people) {
                  return DropdownButtonFormField<PeopleData>(
                    value: _selectedPerson,
                    dropdownColor: const Color(0xFF1E293B),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      labelText: 'Person / Contact (Optional)',
                      labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                      prefixIcon: const Icon(LucideIcons.user, color: Color(0xFF94A3B8), size: 18),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF334155)),
                      ),
                    ),
                    items: people.map((p) {
                      return DropdownMenuItem(value: p, child: Text(p.name));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedPerson = val),
                  );
                },
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
              ),
              const SizedBox(height: 12),

              vehiclesAsync.when(
                data: (vehicles) {
                  return DropdownButtonFormField<Vehicle>(
                    value: _selectedVehicle,
                    dropdownColor: const Color(0xFF1E293B),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      labelText: 'Vehicle / Truck (Optional)',
                      labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                      prefixIcon: const Icon(LucideIcons.truck, color: Color(0xFF94A3B8), size: 18),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF334155)),
                      ),
                    ),
                    items: vehicles.map((v) {
                      return DropdownMenuItem(value: v, child: Text(v.regNumber));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedVehicle = val),
                  );
                },
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _notesController,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  labelText: 'Notes / Remarks (Optional)',
                  labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                  prefixIcon: const Icon(LucideIcons.fileText, color: Color(0xFF94A3B8), size: 18),
                  filled: true,
                  fillColor: const Color(0xFF1E293B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF334155)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Attachment Bill Photo Picker Widget
              AttachmentPickerWidget(
                onImageSelected: (file) {
                  setState(() => _attachedBillPhoto = file);
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: _isSaving ? null : _saveTransaction,
                icon: _isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                      )
                    : const Icon(LucideIcons.check, color: Colors.black),
                label: Text(
                  'Save Record',
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade500,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
