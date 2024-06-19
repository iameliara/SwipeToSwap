import 'package:flutter/material.dart';
import 'package:swipetoswap/profile_screen.dart';
import 'item_card.dart';
import 'product_detail.dart';
import 'product.dart';
import 'category_screen.dart';
import 'upload_screen.dart';
import 'tracking_screen.dart';
import 'lainnya_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreenContent(),
    TrackingScreen(),
    UploadScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3.0,
        color: Color.fromARGB(255, 40, 57, 86),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButtonWithLabel(
              icon: Icons.home,
              iconSize: 250,
              isActive: _currentIndex == 0,
              onTap: () => onTabTapped(0),
            ),
            IconButtonWithLabel(
              icon: Icons.local_shipping,
              iconSize: 250,
              isActive: _currentIndex == 1,
              onTap: () => onTabTapped(1),
            ),
            IconButtonWithLabel(
              icon: Icons.add,
              iconSize: 250,
              isActive: _currentIndex == 2,
              onTap: () => onTabTapped(2),
            ),
            IconButtonWithLabel(
              icon: Icons.person,
              iconSize: 250,
              isActive: _currentIndex == 3,
              onTap: () => onTabTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final bool isActive;
  final VoidCallback onTap;

  IconButtonWithLabel({
    required this.icon,
    required this.iconSize,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          color: isActive ? Colors.white : Colors.grey,
          onPressed: onTap,
        ),
      ],
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = products;

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase()) ||
               product.category.toLowerCase().contains(query.toLowerCase()) ||
               product.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color.fromARGB(255, 15, 55, 122),
            Colors.white,
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 300.0,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                          ),
                          items: [
                            'assets/image1.jpg',
                            'assets/image2.jpg',
                            'assets/image3.jpg',
                            'assets/image4.jpg',
                            'assets/image5.jpg'
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    i,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/placeholder.png', 
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Temukan Segala Kebutuhan Anda Disini',
                                  prefixIcon: Icon(Icons.search_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10), 
                            ElevatedButton(
                              onPressed: () {
                                _filterProducts(_searchController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 37, 67, 110), 
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 23),
                                textStyle: TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                              ),
                              child: Text('Cari'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Kategori',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 47,
                    runSpacing: 50,
                    children: [
                      CategoryButtonWithIcon(
                        icon: Icons.select_all_sharp,
                        label: 'Semua',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Semua'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.book,
                        label: 'Hobi',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Hobi'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.egg,
                        label: 'Makanan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Makanan'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.chair_rounded,
                        label: 'Furnitur',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Furnitur'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.smartphone_outlined,
                        label: 'Elektronik',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Elektronik'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.pedal_bike,
                        label: 'Olahraga',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(category: 'Olahraga'),
                            ),
                          );
                        },
                      ),
                      CategoryButtonWithIcon(
                        icon: Icons.view_module,
                        label: 'See all',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LainnyaScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rekomendasi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: _filteredProducts.map((product) {
                      return ItemCard(
                        imageUrl: product.imageUrl,
                        title: product.title,
                        location: product.location,
                        category: product.category,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(product: product),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  CategoryButtonWithIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 55,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(219, 73, 39, 39).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 33,
              color: Color.fromARGB(255, 48, 61, 109),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
