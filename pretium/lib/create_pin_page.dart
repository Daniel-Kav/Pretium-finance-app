import 'package:flutter/material.dart';
import 'home_page.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({Key? key}) : super(key: key);

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  final List<int?> _pin = List.filled(4, null);
  int _currentIndex = 0;
  bool _showSuccessMessage = false;

  void _addDigit(int digit) {
    if (_currentIndex < 4) {
      setState(() {
        _pin[_currentIndex] = digit;
        _currentIndex++;
        
        // If all digits are entered, show success message
        if (_currentIndex == 4) {
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
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pin[_currentIndex] = null;
        _showSuccessMessage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D6B5B),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  // Lock Icon
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.lock_outline,
                      size: 40,
                      color: const Color(0xFF1D6B5B),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Title
                  const Text(
                    'Create a 4-digit PIN',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // PIN Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          color: _pin[index] != null ? Colors.white : Colors.transparent,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  // Subtitle
                  const Text(
                    'Your PIN will be required to access the app',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Number Pad
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton(1),
                      _buildNumberButton(2),
                      _buildNumberButton(3),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton(4),
                      _buildNumberButton(5),
                      _buildNumberButton(6),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton(7),
                      _buildNumberButton(8),
                      _buildNumberButton(9),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Empty space to maintain layout
                      const SizedBox(width: 80),
                      _buildNumberButton(0),
                      _buildDeleteButton(),
                    ],
                  ),
                ],
              ),
            ),
            // Success Toast Message
            if (_showSuccessMessage)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.celebration_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Success, welcome back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return InkWell(
      onTap: () => _addDigit(number),
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return InkWell(
      onTap: _removeDigit,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(
            Icons.backspace_outlined,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}