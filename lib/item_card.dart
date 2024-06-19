import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String location;
  final VoidCallback onTap;

  ItemCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Image.asset(imageUrl, fit: BoxFit.fill, height: 200, width: double.infinity),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Text(
                category,
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                children: [
                  Icon(Icons.location_pin, color: Color.fromARGB(255, 51, 43, 137), size: 16.0),
                  SizedBox(width: 7.0),
                  Text(location, style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
