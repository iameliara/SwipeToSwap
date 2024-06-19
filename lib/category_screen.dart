import 'package:flutter/material.dart';
import 'product.dart';
import 'item_card.dart';
import 'product_detail.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = category == 'Semua'
        ? products
        : products.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: filteredProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ItemCard(
              imageUrl: product.imageUrl,
              title: product.title,
              location: product.location,
              category: product.category,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      product: product,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
