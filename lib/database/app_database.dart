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

  // --- PEOPLE HELPER METHODS ---
  Stream<List<PeopleData>> watchAllPeople() {
    return (select(people)..where((tbl) => tbl.isActive.equals(true))).watch();
  }

  Future<int> insertPersonWithRoles(PeopleCompanion person, List<String> roles) async {
    return transaction(() async {
      final personId = await into(people).insert(person);
      for (final r in roles) {
        await into(personRoles).insert(PersonRolesCompanion.insert(
          personId: personId,
          role: r,
        ));
      }
      return personId;
    });
  }

  Stream<List<Transaction>> watchPersonTimeline(int personId) {
    return (select(transactions)
          ..where((tbl) => tbl.personId.equals(personId) & tbl.isDeleted.equals(false))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)]))
        .watch();
  }

  // --- VEHICLES HELPER METHODS ---
  Stream<List<Vehicle>> watchVehiclesByCompany(int companyId) {
    return (select(vehicles)..where((tbl) => tbl.companyId.equals(companyId))).watch();
  }

  Future<int> insertVehicle(VehiclesCompanion vehicle) {
    return into(vehicles).insert(vehicle);
  }

  Stream<List<Transaction>> watchVehicleTimeline(int vehicleId) {
    return (select(transactions)
          ..where((tbl) => tbl.vehicleId.equals(vehicleId) & tbl.isDeleted.equals(false))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)]))
        .watch();
  }

  // --- CATEGORIES & ACCOUNTS HELPER METHODS ---
  Stream<List<TransactionCategory>> watchCategories(String direction) {
    return (select(transactionCategories)
          ..where((tbl) => tbl.direction.equals(direction)))
        .watch();
  }

  Stream<List<PaymentAccount>> watchPaymentAccounts() {
    return (select(paymentAccounts)..where((tbl) => tbl.isActive.equals(true))).watch();
  }

  Future<int> insertCategory(TransactionCategoriesCompanion category) {
    return into(transactionCategories).insert(category);
  }

  // --- TRANSACTIONS HELPER METHODS ---
  Stream<List<Transaction>> watchRecentTransactions(int companyId, {int limit = 20}) {
    return (select(transactions)
          ..where((tbl) => tbl.companyId.equals(companyId) & tbl.isDeleted.equals(false))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)])
          ..limit(limit))
        .watch();
  }

  Future<int> createTransaction(TransactionsCompanion tx) async {
    return transaction(() async {
      final txId = await into(transactions).insert(tx);

      // Audit Log Entry
      await into(auditLogs).insert(AuditLogsCompanion.insert(
        transactionId: Value(txId),
        action: 'Create',
        userId: 'Owner',
        newValueJson: Value('Amount: ${tx.amount.value}, Dir: ${tx.direction.value}'),
      ));

      return txId;
    });
  }

  // --- TRIPS HELPER METHODS ---
  Stream<List<Trip>> watchTripsByCompany(int companyId) {
    return (select(trips)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<int> insertTrip(TripsCompanion trip) {
    return into(trips).insert(trip);
  }

  Stream<List<Transaction>> watchTripTransactions(int tripId) {
    return (select(transactions)
          ..where((tbl) => tbl.tripId.equals(tripId) & tbl.isDeleted.equals(false))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)]))
        .watch();
  }

  Future<void> updateTripStatus(int tripId, String status) {
    return (update(trips)..where((tbl) => tbl.id.equals(tripId))).write(
      TripsCompanion(status: Value(status)),
    );
  }

  // --- TRUCK DEALS HELPER METHODS ---
  Stream<List<TruckDeal>> watchDealsByCompany(int companyId) {
    return (select(truckDeals)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<int> insertDealWithComponents(TruckDealsCompanion deal, List<String> components) async {
    return transaction(() async {
      final dealId = await into(truckDeals).insert(deal);

      for (final compType in components) {
        await into(vehicleComponents).insert(VehicleComponentsCompanion.insert(
          vehicleId: deal.vehicleId.value,
          componentType: compType,
          status: const Value('Unsold'),
        ));
      }
      return dealId;
    });
  }

  Stream<List<VehicleComponent>> watchDealComponents(int vehicleId) {
    return (select(vehicleComponents)..where((tbl) => tbl.vehicleId.equals(vehicleId))).watch();
  }

  Stream<List<Transaction>> watchDealTransactions(int dealId) {
    return (select(transactions)
          ..where((tbl) => tbl.dealId.equals(dealId) & tbl.isDeleted.equals(false))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)]))
        .watch();
  }

  Future<void> recordComponentSale(TransactionsCompanion tx, int componentId) async {
    await transaction(() async {
      final txId = await into(transactions).insert(tx);
      await (update(vehicleComponents)..where((tbl) => tbl.id.equals(componentId))).write(
        VehicleComponentsCompanion(
          status: const Value('Sold'),
          saleTransactionId: Value(txId),
        ),
      );
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
