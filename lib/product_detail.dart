import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'product.dart';

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imageUrl, fit: BoxFit.cover, width: double.infinity),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.category,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'DESKRIPSI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(product.description),
            SizedBox(height: 16),
            Text(
              'LOKASI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_pin),
                SizedBox(width: 8),
                Text(product.location),
              ],
            ),
            InkWell(
              onTap: () => _launchUrl(product.mapsUrl),
              child: Text(
                product.mapsUrl,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'WhatsApp',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
            InkWell(
              onTap: () => _launchUrl(product.whatsappUrl),
              child: Text(
                product.whatsappUrl,
                style: TextStyle(
                  color: Colors.blue,
                ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}