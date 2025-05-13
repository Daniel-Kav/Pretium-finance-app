import 'package:flutter/material.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  final List<int> _pin = [];

  void _onKeyPressed(int? value) {
    setState(() {
      if (value == null) {
        if (_pin.isNotEmpty) _pin.removeLast();
      } else if (_pin.length < 4) {
        _pin.add(value);
        if (_pin.length == 4) {
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
          });
        }
      }
    });
  }

  Widget _buildPinCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            color: _pin.length > index ? Colors.white : Colors.transparent,
          ),
        );
      }),
    );
  }

  Widget _buildKey(int number) {
    return GestureDetector(
      onTap: () => _onKeyPressed(number),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '$number',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey() {
    return GestureDetector(
      onTap: () => _onKeyPressed(null),
      child: const Icon(Icons.backspace_outlined, color: Colors.white, size: 32),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18534F),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.lock, size: 60, color: Colors.white),
            const SizedBox(height: 32),
            const Text(
              'Create a 4-digit PIN',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildPinCircles(),
            const SizedBox(height: 16),
            const Text(
              'Your PIN will be required to access the app',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var row in [
                      [1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                      [null, 0, 'back']
                    ])
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: row.map<Widget>((item) {
                          if (item == null) {
                            return const SizedBox(width: 64);
                          } else if (item == 'back') {
                            return SizedBox(width: 64, child: _buildBackspaceKey());
                          } else {
                            return SizedBox(width: 64, child: _buildKey(item as int));
                          }
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 