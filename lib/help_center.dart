import 'package:flutter/material.dart';


class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/logo-stw-2.png', 
              height: 250,
            ),
            SizedBox(height: 40),
            Text(
              'Butuh Bantuan?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Silakan hubungi kami melalui,',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 60),
            ContactOption(
              icon: Icons.phone,
              label: 'Call center',
              contact: '15000023',
            ),
            Divider(color: Colors.black),
            ContactOption(
              icon: Icons.sms,
              label: 'SMS',
              contact: '+62 812-3456-7890',
            ),
            Divider(color: Colors.black),
            ContactOption(
              icon: Icons.email,
              label: 'E-mail',
              contact: 'sobatsts@swipetoswap.ac.id',
            ),
            Divider(color: Colors.black),
            ContactOption(
              icon: Icons.web,
              label: 'Website',
              contact: 'www.SwipetoSwap.co.id',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String contact;

  ContactOption({required this.icon, required this.label, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  contact,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

