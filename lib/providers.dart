import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database/app_database.dart';
import 'services/auth_service.dart';

/// Database Singleton Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Auth Service Provider
final authServiceProvider = ChangeNotifierProvider<AuthService>((ref) {
  return AuthService();
});

/// Selected Active Company Provider
final selectedCompanyProvider = StateProvider<Company?>((ref) => null);

/// Companies Stream Provider
final companiesStreamProvider = StreamProvider<List<Company>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.companies).watch();
});

/// People Stream Provider
final peopleStreamProvider = StreamProvider<List<PeopleData>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllPeople();
});

/// Vehicles Stream Provider (filtered by selected company)
final vehiclesStreamProvider = StreamProvider<List<Vehicle>>((ref) {
  final db = ref.watch(databaseProvider);
  final company = ref.watch(selectedCompanyProvider);
  if (company == null) return Stream.value([]);
  return db.watchVehiclesByCompany(company.id);
});

/// Payment Accounts Stream Provider
final paymentAccountsStreamProvider = StreamProvider<List<PaymentAccount>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchPaymentAccounts();
});

/// Recent Transactions Stream Provider
final recentTransactionsStreamProvider = StreamProvider<List<Transaction>>((ref) {
  final db = ref.watch(databaseProvider);
  final company = ref.watch(selectedCompanyProvider);
  if (company == null) return Stream.value([]);
  return db.watchRecentTransactions(company.id);
});
