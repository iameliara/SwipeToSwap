import 'package:flutter/material.dart';
import 'package:swipetoswap/develop_detail.dart';
import 'package:swipetoswap/help_center.dart';
import 'package:swipetoswap/homescreen.dart';
import 'package:swipetoswap/show_details.dart';
import 'package:swipetoswap/signup_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showWarningCard = false;
  bool _obscurePassword = false;

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
                print('Email: ${_emailController.text}');
                Navigator.of(context).pop();
              },
              child: Text('Kirim'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _showWarningCard = !_showWarningCard;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 52, 53, 94),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('assets/login.png'),
                        height: 350,
                        width: 750,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 52, 53, 94),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowDetails(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/details.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Informasi'),
                        ],
                      ),
                      SizedBox(width: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPenulis(
                                    author1: Penulis.data[0],
                                    author2: Penulis.data[1],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/develop.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Pengembang'),
                        ],
                      ),
                      SizedBox(width: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpCenterScreen(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/helpdesk.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Narahubung'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 232, 235, 244),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Batalkan',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 73, 138),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor:
                                            Color.fromARGB(255, 31, 32, 76),
                                        child: Icon(
                                          Icons.person_outline,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          labelText: 'User name',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 16),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscurePassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
                                              });
                                            },
                                          ),
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        obscureText: _obscurePassword = true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Silakan masukkan password Anda';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 16),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: _showForgotPasswordDialog,
                                          child: Text(
                                            'Lupa username/password?',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 64, 67, 126),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Log In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFD36E35),
                                          minimumSize:
                                              Size(double.infinity, 50),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 211, 110, 53),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 29, 106),
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 52, 52, 87),
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            if (_showWarningCard)
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Card(
                  color: Color.fromARGB(255, 232, 235, 244),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Peringatan !',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _showWarningCard = false;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tetap waspada terhadap potensi penipuan saat menggunakan aplikasi Swipe to Swap. Segala bentuk transaksi atau penukaran terjadi di luar kebijakan aplikasi dan bukan menjadi tanggung jawab kami. Jika Anda mencurigai adanya penipuan, segera laporkan ke pihak berwenang dan jangan ragu untuk meminta bantuan.',
                        ),
                        SizedBox(height: 18),
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
}
