import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF18534F),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('D', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Hello, Daniel 👋',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Icon(Icons.notifications_none, color: Colors.white),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B6B5B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F0ED),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF18534F)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.visibility, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('Wallet Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('KES ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                        Text('0.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('\$240.00', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Financial Services Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Financial Services', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Row(
                          children: const [
                            Text('Kenya', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold)),
                            Icon(Icons.keyboard_arrow_down, color: Color(0xFF18534F)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _ServiceIcon(icon: Icons.send, label: 'Send Money'),
                            _ServiceIcon(icon: Icons.shopping_basket, label: 'Buy Goods'),
                            _ServiceIcon(icon: Icons.receipt_long, label: 'Paybill'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Row(
                            children: const [
                              _ServiceIcon(icon: Icons.phone_android, label: 'Airtime'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Recent Transactions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Recent transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('See all', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: const [
                    Icon(Icons.receipt_long, size: 60, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('No recent transactions', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF18534F)),
                onPressed: () {},
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF18534F),
                  elevation: 2,
                  onPressed: () {},
                  child: const Icon(Icons.qr_code, color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.receipt_long, color: Color(0xFF18534F)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ServiceIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFE6F0ED),
          child: Icon(icon, color: Color(0xFF18534F)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Color(0xFF18534F))),
      ],
    );
  }
} 