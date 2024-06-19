import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Image.asset(
                  'assets/searching-stw.png', 
                  height: 400,
                  ),
            SizedBox(height: 20),
            Text(
              'Temukan Cara Baru untuk Tukar Menukar dengan "Swipe to Swap"',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Bayangkan jika terdapat sebuah platform di mana Anda dapat menukarkan barang atau makanan yang tidak lagi dibutuhkan dengan sesuatu lain sesuai keinginan Anda. Jadi, selamat datang di "Swipe to Swap", aplikasi revolusioner yang mengubah sesuatu tak terpakai Anda menjadi harta karun',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'Mengapa "Swipe to Swap"?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
             leading: Image.asset('assets/satu-stw.png', width: 50, height: 50),
              title: Text(
                'Ramah Lingkungan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Kurangi limbah dengan menukarkan barang atau makanan Anda daripada membuangnya atau membeli yang baru.'),
            ),
            ListTile(
              leading: Image.asset('assets/dua-stw.png', width: 50, height: 50),
              title: Text(
                'Menyediakan Beragam Pilihan',
              style: TextStyle(fontWeight: FontWeight.bold),
                ),
              subtitle: Text('Dari elektronik hingga pakaian, dekorasi rumah hingga koleksi, Swipe to Swap menawarkan berbagai kategori yang beragam.'),
            ),
            ListTile(
              leading: Image.asset('assets/tiga-stw.png', width: 50, height: 50),
              title: Text(
                'Kemudahan Akses',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Swipe to Swap menghadirkan pasar pada layar dagdet Anda, membuat pertukaran cepat, tanpa iklan dan bebas repot.'),
            ),
            ListTile(
              leading: Image.asset('assets/empat-stw.png', width: 50, height: 50),
              title: Text('Efektivitas',
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Mungkin seseorang di luar sana mencari apa yang Anda miliki, dan mereka memiliki apa yang Anda butuhkan.'),
            ),
            SizedBox(height: 16),
            Text(
              'Mulailah Sekarang!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Jadi, tunggu apalagi? Siap untuk mengubah cara Anda bertukar barang atau kebutuhannya lainnya? Gunakan Swipe to Swap sekarang dan temukan cara tukar menukar dengan praktis dan menyenangkan!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 25),
            Text(
              'Just Swipe Swipe and Brings New Possibilities!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
               textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
