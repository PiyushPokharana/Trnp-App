import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Companies,
  People,
  PersonRoles,
  Vehicles,
  VehicleComponents,
  TransactionCategories,
  PaymentAccounts,
  Trips,
  TruckDeals,
  Transactions,
  AuditLogs,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'trnp_business_history.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          // Seed Default Payment Accounts
          await into(paymentAccounts).insert(PaymentAccountsCompanion.insert(
            name: 'Cash Wallet',
            type: 'Cash',
            openingBalance: const Value(0.0),
          ));
          await into(paymentAccounts).insert(PaymentAccountsCompanion.insert(
            name: 'Bank Account',
            type: 'Bank',
            openingBalance: const Value(0.0),
          ));
          await into(paymentAccounts).insert(PaymentAccountsCompanion.insert(
            name: 'UPI / PhonePe',
            type: 'UPI',
            openingBalance: const Value(0.0),
          ));

          // Seed Default Transaction Categories
          final defaultCategories = [
            // Outflows
            {'name': 'Diesel', 'direction': 'Outflow', 'icon': 'fuel'},
            {'name': 'Toll Tax', 'direction': 'Outflow', 'icon': 'receipt'},
            {'name': 'Vehicle Repair', 'direction': 'Outflow', 'icon': 'wrench'},
            {'name': 'Driver Advance', 'direction': 'Outflow', 'icon': 'user-check'},
            {'name': 'Cutting & Labour', 'direction': 'Outflow', 'icon': 'hammer'},
            {'name': 'RTO & Permits', 'direction': 'Outflow', 'icon': 'file-text'},
            {'name': 'Transport Expense', 'direction': 'Outflow', 'icon': 'truck'},
            {'name': 'Misc Expense', 'direction': 'Outflow', 'icon': 'minus-circle'},

            // Inflows
            {'name': 'Freight Income', 'direction': 'Inflow', 'icon': 'dollar-sign'},
            {'name': 'Advance Received', 'direction': 'Inflow', 'icon': 'arrow-down-left'},
            {'name': 'Vehicle Part Sale', 'direction': 'Inflow', 'icon': 'package'},
            {'name': 'Full Truck Sale', 'direction': 'Inflow', 'icon': 'truck'},
            {'name': 'Misc Income', 'direction': 'Inflow', 'icon': 'plus-circle'},
          ];

          for (final cat in defaultCategories) {
            await into(transactionCategories).insert(
              TransactionCategoriesCompanion.insert(
                name: cat['name']!,
                direction: cat['direction']!,
                iconName: Value(cat['icon']),
                isUserCreated: const Value(false),
              ),
            );
          }

          // Seed Default Companies
          await into(companies).insert(CompaniesCompanion.insert(
            name: 'Transport Business',
            businessType: 'Transport',
          ));
          await into(companies).insert(CompaniesCompanion.insert(
            name: 'Truck Trading & Scrap',
            businessType: 'Trading',
          ));
        },
      );
}
