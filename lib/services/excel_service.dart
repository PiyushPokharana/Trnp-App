import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import '../database/app_database.dart';

class ExcelService {
  /// Export transactions list to .xlsx spreadsheet
  static Future<void> exportTransactionsToExcel({
    required String companyName,
    required List<Transaction> transactions,
  }) async {
    final excel = Excel.createExcel();
    final Sheet sheet = excel['Transactions'];
    excel.setDefaultSheet('Transactions');

    // Header Row
    sheet.appendRow([
      TextCellValue('Date'),
      TextCellValue('Type / Direction'),
      TextCellValue('Amount (INR)'),
      TextCellValue('Payment Method'),
      TextCellValue('Reference No'),
      TextCellValue('Notes'),
    ]);

    // Data Rows
    for (final tx in transactions) {
      sheet.appendRow([
        TextCellValue(DateFormat('yyyy-MM-dd HH:mm').format(tx.date)),
        TextCellValue(tx.direction),
        DoubleCellValue(tx.amount),
        TextCellValue(tx.paymentMethod),
        TextCellValue(tx.referenceNo ?? ''),
        TextCellValue(tx.notes ?? ''),
      ]);
    }

    final bytes = excel.encode();
    if (bytes == null) return;

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${companyName.replaceAll(' ', '_')}_Transactions.xlsx');
    await file.writeAsBytes(bytes);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: '$companyName Transactions Export',
    );
  }

  /// Export Person / Customer Ledger to .xlsx
  static Future<void> exportPersonLedgerToExcel({
    required PeopleData person,
    required List<Transaction> transactions,
  }) async {
    final excel = Excel.createExcel();
    final Sheet sheet = excel['Person Ledger'];
    excel.setDefaultSheet('Person Ledger');

    sheet.appendRow([TextCellValue('Person Name: ${person.name}')]);
    sheet.appendRow([TextCellValue('Phone: ${person.phone ?? "N/A"}')]);
    sheet.appendRow([]); // Empty spacer row

    sheet.appendRow([
      TextCellValue('Date'),
      TextCellValue('Direction'),
      TextCellValue('Amount (INR)'),
      TextCellValue('Payment Method'),
      TextCellValue('Notes'),
    ]);

    double netBalance = 0.0;
    for (final tx in transactions) {
      if (tx.direction == 'Inflow') netBalance += tx.amount;
      if (tx.direction == 'Outflow') netBalance -= tx.amount;

      sheet.appendRow([
        TextCellValue(DateFormat('yyyy-MM-dd HH:mm').format(tx.date)),
        TextCellValue(tx.direction),
        DoubleCellValue(tx.amount),
        TextCellValue(tx.paymentMethod),
        TextCellValue(tx.notes ?? ''),
      ]);
    }

    sheet.appendRow([]);
    sheet.appendRow([
      TextCellValue('Net Account Balance:'),
      TextCellValue(''),
      DoubleCellValue(netBalance),
    ]);

    final bytes = excel.encode();
    if (bytes == null) return;

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/Ledger_${person.name.replaceAll(' ', '_')}.xlsx');
    await file.writeAsBytes(bytes);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Ledger for ${person.name}',
    );
  }
}
