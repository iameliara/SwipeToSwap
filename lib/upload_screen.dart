import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:swipetoswap/homescreen.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _alamatController = TextEditingController();
  final _whatsappController = TextEditingController();
  File? _image;
  Uint8List? _webImage;
  final picker = ImagePicker();
  String? _selectedCategory;

  final List<String> _categories = [
    'Makanan',
    'Pakaian',
    'Furnitur',
    'Elektronik',
    'Kecantikan',
    'Gadget',
    'Alat Tulis',
    'Hobi',
    'Olahraga',
    'Aksesoris'
  ];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (kIsWeb) {
          pickedFile.readAsBytes().then((bytes) {
            setState(() {
              _webImage = bytes;
            });
          });
        } else {
          _image = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  void _uploadItem() {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _alamatController.text.isNotEmpty &&
        _whatsappController.text.isNotEmpty &&
        (_image != null || _webImage != null) &&
        _selectedCategory != null) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi dan gambar harus dipilih!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasarkan Produk Anda'),
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
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: _image == null && _webImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 50, color: Colors.grey),
                              SizedBox(height: 8),
                              Text(
                                'Upload Produk',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        : kIsWeb
                            ? Image.memory(
                                _webImage!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : Image.file(
                                _image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Produk',
                hintText: 'Masukkan Nama Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Pilih Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                hintText: 'Masukkan Deskripsi Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(Icons.star, color: Colors.red),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: 'Alamat',
                hintText: 'Masukkan Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(Icons.location_on, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _whatsappController,
              decoration: InputDecoration(
                labelText: 'Nomor WhatsApp',
                hintText: 'Masukkan Nomor WhatsApp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(Icons.phone, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
            onPressed: _uploadItem,
              child: Text(
                'Upload Item',
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.white, 
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 28, 43, 97), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Produk Anda berhasil diupload',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Tim kami akan memeriksa produk Anda dan pantau email secara berkala.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
