import 'package:flutter/material.dart';

import 'homescreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _emailController = TextEditingController();
        return AlertDialog(
          title: Text('Lupa username/password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Masukkan email Anda untuk mengatur ulang kata sandi.'),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                final email = _emailController.text;
                if (email.isNotEmpty && email.contains('@')) {
                  _sendPasswordResetEmail(email);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Silakan masukkan email yang valid')),
                  );
                }
              },
              child: Text('Kirim'),
            ),
          ],
        );
      },
    );
  }

  void _sendPasswordResetEmail(String email) {
    print('Sending password reset email to $email');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email pengaturan ulang kata sandi telah dikirim')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/sapardi.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sapardi Djoko Damono',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'dojoko123@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Mode',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Gelap & Terang',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text(
                'Ubah Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: _showForgotPasswordDialog,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Swipe to Swap',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2024 Amel&Ammor',
                  children: [
                    Text('This is a simple application to demonstrate various functionalities in Flutter.'),
                  ],
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Bagikan Aplikasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

