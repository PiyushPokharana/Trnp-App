import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinLockScreen extends StatefulWidget {
  final bool isSetupMode;
  final VoidCallback? onUnlocked;

  const PinLockScreen({super.key, this.isSetupMode = false, this.onUnlocked});

  @override
  State<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends State<PinLockScreen> {
  String _enteredPin = '';
  String? _savedPin;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadSavedPin();
  }

  Future<void> _loadSavedPin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedPin = prefs.getString('app_pin_code');
    });
  }

  void _onKeyPress(String digit) {
    if (_enteredPin.length < 4) {
      setState(() {
        _enteredPin += digit;
        _errorMessage = '';
      });

      if (_enteredPin.length == 4) {
        _handlePinComplete();
      }
    }
  }

  void _onDelete() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
        _errorMessage = '';
      });
    }
  }

  Future<void> _handlePinComplete() async {
    if (widget.isSetupMode) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_pin_code', _enteredPin);
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('App Lock PIN set successfully.'), backgroundColor: Colors.green),
        );
      }
    } else {
      if (_enteredPin == _savedPin) {
        widget.onUnlocked?.call();
      } else {
        setState(() {
          _enteredPin = '';
          _errorMessage = 'Incorrect PIN. Try again.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24.0),
          child: Column(
            children: [
              const Spacer(),
              Icon(LucideIcons.lock, size: 56, color: Colors.amber.shade400),
              const SizedBox(height: 16),
              Text(
                widget.isSetupMode ? 'Set 4-Digit Security PIN' : 'Enter App Lock PIN',
                style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                widget.isSetupMode ? 'Enter a 4-digit code to protect your ledger' : 'App locked for financial privacy',
                style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 24),

              // PIN Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isFilled = index < _enteredPin.length;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled ? Colors.amber.shade400 : const Color(0xFF334155),
                    ),
                  );
                }),
              ),

              if (_errorMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(_errorMessage, style: GoogleFonts.inter(color: Colors.redAccent, fontSize: 13)),
              ],

              const Spacer(),

              // Numeric Keypad Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 9) return const SizedBox();
                  if (index == 10) return _buildKeypadButton('0');
                  if (index == 11) {
                    return IconButton(
                      icon: const Icon(LucideIcons.delete, color: Colors.white),
                      onPressed: _onDelete,
                    );
                  }
                  return _buildKeypadButton('${index + 1}');
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String digit) {
    return InkWell(
      onTap: () => _onKeyPress(digit),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF334155)),
        ),
        child: Center(
          child: Text(
            digit,
            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
