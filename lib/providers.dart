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

/// Selected Active Company Provider (null = All Companies overview)
final selectedCompanyProvider = StateProvider<Company?>((ref) => null);

/// Companies Stream Provider
final companiesStreamProvider = StreamProvider<List<Company>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.companies).watch();
});
