import 'package:flutter/material.dart';
import 'category_screen.dart';  // Pastikan impor ini ada

class LainnyaScreen extends StatefulWidget {
  @override
  _LainnyaScreenState createState() => _LainnyaScreenState();
}

class _LainnyaScreenState extends State<LainnyaScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Category> _categories = [
    Category(title: 'Makanan', imagePath: 'assets/makanan.png'),
    Category(title: 'Pakaian', imagePath: 'assets/pakaian.png'),
    Category(title: 'Furnitur', imagePath: 'assets/furnitur.png'),
    Category(title: 'Elektronik', imagePath: 'assets/elektronik.png'),
    Category(title: 'Kecantikan', imagePath: 'assets/kecantikan.png'),
    Category(title: 'Gadget', imagePath: 'assets/gadget.png'),
    Category(title: 'Alat Tulis', imagePath: 'assets/alat_tulis.png'),
    Category(title: 'Hobi', imagePath: 'assets/hobi.png'),
    Category(title: 'Olahraga', imagePath: 'assets/olahraga.png'),
    Category(title: 'Aksesoris', imagePath: 'assets/aksesoris.png'),
  ];
  List<Category> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _filteredCategories = _categories;
    _searchController.addListener(_filterCategories);
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories = _categories.where((category) {
        return category.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temukan Lebih Banyak'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Kategori',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: _filteredCategories.map((category) {
                  return CategoryCard(
                    title: category.title,
                    imagePath: category.imagePath,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(category: category.title),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final String imagePath;

  Category({required this.title, required this.imagePath});
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  CategoryCard({required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 30,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
