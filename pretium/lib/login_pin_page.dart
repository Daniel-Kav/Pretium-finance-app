import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPinPage extends StatefulWidget {
  const LoginPinPage({Key? key}) : super(key: key);

  @override
  State<LoginPinPage> createState() => _LoginPinPageState();
}

class _LoginPinPageState extends State<LoginPinPage> {
  String _pin = '';
  final int _pinLength = 4;
  bool _showSuccessMessage = false;

  void _addDigit(String digit) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin += digit;
        
        // If all digits are entered, show success message and navigate
        if (_pin.length == _pinLength) {
          _showSuccessMessage = true;
          // Show success snackbar
          Future.delayed(const Duration(milliseconds: 200), () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success, welcome back!', style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
              ),
            );
            Future.delayed(const Duration(milliseconds: 1200), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            });
          });
        }
      });
    }
  }

  void _removeDigit() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  Widget _buildPinDot(bool filled) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
        color: filled ? Colors.white : Colors.transparent,
      ),
    );
  }

  Widget _buildKeypadButton(String value, {bool isIcon = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => _addDigit(value),
      child: Container(
        width: 80,
        height: 8,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isIcon ? Colors.transparent : Colors.white24,
        ),
        child: Center(
          child: isIcon
              ? (value == 'fingerprint'
                  ? const Icon(Icons.fingerprint, size: 36, color: Colors.white)
                  : const Icon(Icons.backspace_outlined, size: 28, color: Colors.white))
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18534F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Hello, Daniel 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Verify your PIN to unlock',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pinLength,
                  (index) => _buildPinDot(index < _pin.length),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKeypadButton('1'),
                      _buildKeypadButton('2'),
                      _buildKeypadButton('3'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKeypadButton('4'),
                      _buildKeypadButton('5'),
                      _buildKeypadButton('6'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKeypadButton('7'),
                      _buildKeypadButton('8'),
                      _buildKeypadButton('9'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKeypadButton('fingerprint', isIcon: true),
                      _buildKeypadButton('0'),
                      _buildKeypadButton('backspace', isIcon: true, onTap: _removeDigit),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot PIN?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}