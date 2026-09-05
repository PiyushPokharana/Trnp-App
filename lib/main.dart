import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers.dart';
import 'screens/auth/google_login_screen.dart';
import 'screens/company_selector_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: TrnpApp(),
    ),
  );
}

class TrnpApp extends ConsumerWidget {
  const TrnpApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    return MaterialApp(
      title: 'Business History & Ledger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.dark(
          primary: Colors.amber.shade500,
          surface: const Color(0xFF1E293B),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: authService.isLoading
          ? const Scaffold(
              backgroundColor: Color(0xFF0F172A),
              body: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            )
          : authService.isAuthenticated
              ? const CompanySelectorScreen()
              : const GoogleLoginScreen(),
    );
  }
}
