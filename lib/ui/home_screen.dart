import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile-pict.png'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Haidar 👋',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Front-End Developer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Welcome Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'ScannerCode',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Button Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'What would you like to do?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Grid of Action Buttons
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              childAspectRatio: 1.1, // Slightly rectangular buttons
              children: [
                BuildButton(
                  icon: Icons.qr_code,
                  label: 'Create',
                  backgroundColor: Colors.blueAccent,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, '/create');
                  },
                ),
                BuildButton(
                  icon: Icons.qr_code_scanner,
                  label: 'Scan',
                  backgroundColor: Colors.redAccent.withOpacity(0.6),
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, '/scan');
                  },
                ),
                BuildButton(
                  icon: Icons.send,
                  label: 'Send',
                  backgroundColor: Colors.greenAccent.withOpacity(0.5),
                  iconColor: Colors.white,
                  onTap: () {},
                ),
                BuildButton(
                  icon: Icons.print,
                  label: 'Print',
                  backgroundColor: Colors.purpleAccent.withOpacity(0.4),
                  iconColor: Colors.white,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Button Widget
class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150, // Slightly narrower button width
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the button
          borderRadius: BorderRadius.circular(16), // Slightly rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Softer shadow
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(30), // Adjusted for better spacing
              child: Icon(
                icon,
                color: iconColor,
                size: 45, // Slightly bigger icon
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
