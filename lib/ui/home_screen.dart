import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List<String, String>

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile-pict.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Hallo, Haidar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Front-End Developer',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'QR SCANNER ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            children: [
              BuildButton(
                  icon: Icons.qr_code,
                  label: 'Create',
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, '/create');
                  }),
              BuildButton(
                  icon: Icons.qr_code_scanner,
                  label: 'Scan',
                  backgroundColor: Colors.red.withOpacity(0.5),
                  iconColor: Colors.white,
                  onTap: () {
                     Navigator.pushNamed(context, '/scan');
                  }),
              BuildButton(
                  icon: Icons.send,
                  label: 'Send',
                  backgroundColor: Colors.green.withOpacity(0.4),
                  iconColor: Colors.white,
                  onTap: () {}),
              BuildButton(
                  icon: Icons.print,
                  label: 'Print',
                  backgroundColor: Colors.purple.withOpacity(0.3),
                  iconColor: Colors.white,
                  onTap: () {})
            ],
          ))
        ],
      ),
    );
  }
}

// iconn
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
        width: 170, // Lebar tetap untuk setiap tombol
        height: 170, // Tinggi tetap untuk setiap tombol
        decoration: BoxDecoration(
          // color: Colors.white, // Latar tombol abu-abu terang
          borderRadius: BorderRadius.circular(20), // Sudut membulat
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Bayangan lembut
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor, // Warna latar ikon
                borderRadius: BorderRadius.circular(12), // Sudut membulat ikon
              ),
              padding: const EdgeInsets.all(35),
              child: Icon(
                icon,
                color: iconColor, // Warna ikon
                size: 40, // Ukuran ikon lebih besar
              ),
            ),
            const SizedBox(height: 15), // Jarak antara ikon dan teks
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16, // Ukuran teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}
