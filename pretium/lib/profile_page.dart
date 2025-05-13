import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF18534F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFFE6E6E6),
                      child: Text('DK', style: TextStyle(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text('Coming Soon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(width: 4),
                            Icon(Icons.edit, size: 18),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('dankavatha01@gmail.com', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _ProfileTile(icon: Icons.currency_exchange, title: 'Currency', trailing: Text('KES', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold))),
                _ProfileTile(icon: Icons.account_balance_wallet_rounded, title: 'Assets', trailing: const Icon(Icons.chevron_right)),
                _ProfileTile(icon: Icons.compare_arrows, title: 'Wallet Address', trailing: const Icon(Icons.chevron_right)),
                _ProfileTile(icon: Icons.telegram, title: 'Contact Support', trailing: const Icon(Icons.open_in_new)),
                _ProfileTile(icon: Icons.description, title: 'Terms and Conditions', trailing: const Icon(Icons.open_in_new), highlighted: true),
                _ProfileTile(icon: Icons.privacy_tip, title: 'Privacy Policy', trailing: const Icon(Icons.open_in_new)),
                _ProfileTile(icon: Icons.phone_android, title: 'App Version', trailing: const Text('1.0.0+16', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold))),
                _ProfileTile(
                  icon: Icons.logout,
                  title: 'Sign out',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
                _ProfileTile(icon: Icons.delete, title: 'Delete Account', trailing: const Icon(Icons.chevron_right)),
                const SizedBox(height: 80),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F0ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Rate App 👍', style: TextStyle(color: Color(0xFF18534F), fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final bool highlighted;
  final VoidCallback? onTap;
  const _ProfileTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.highlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: highlighted ? const Color(0xFFF3F7F6) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF18534F)),
              const SizedBox(width: 20),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
} 