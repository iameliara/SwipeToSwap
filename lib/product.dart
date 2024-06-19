class Product {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final String mapsUrl;
  final String whatsappUrl;
  final String category;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.mapsUrl,
    required this.whatsappUrl,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      imageUrl: map['imageUrl'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      mapsUrl: map['mapsUrl'],
      whatsappUrl: map['whatsappUrl'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'location': location,
      'mapsUrl': mapsUrl,
      'whatsappUrl': whatsappUrl,
      'category': category,
    };
  }
}

List<Product> products = [
  Product(
    imageUrl: 'assets/photocard_bts.jpeg',
    title: 'Photocard BTS Ori',
    description: 'Photocard BTS Ori, langka dan dalam kondisi baik.',
    location: 'Jl. Jagir Wonokromo Wetan No. 3',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8?utm_source=google&utm_medium=maps',
    whatsappUrl: 'https://wa.me/6281235224294?utm_source=google&utm_medium=whatsapp',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/sepatu_adidas.jpeg',
    title: 'Sepatu Adidas',
    description: 'Sepatu Adidas, nyaman dan stylish untuk berbagai aktivitas.',
    location: 'Jl. Ngagel Jaya Selatan No.11A',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Pakaian',
  ),
  Product(
    imageUrl: 'assets/iphone.jpeg',
    title: 'Iphone',
    description: 'Iphone dalam kondisi baik, lengkap dengan aksesoris.',
    location: 'Jl. Jagir Wonokromo Wetan No. 3',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Gadget',
  ),
  Product(
    imageUrl: 'assets/kursi_pink.jpeg',
    title: 'Kursi Pink Lucu',
    description: 'Kursi pink lucu, cocok untuk dekorasi ruangan atau tempat duduk santai.',
    location: 'Jl. Ngagel Jaya Selatan No.11A',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Furnitur',
  ),
  Product(
    imageUrl: 'assets/buku_bridgerton.jpeg',
    title: 'Buku Bridgerton',
    description: 'Buku seri Bridgerton, lengkap dengan cerita yang menarik.',
    location: 'Jl. Jagir Wonokromo Wetan No. 3',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/dyson_straightener.jpeg',
    title: 'Dyson Hair Straightener',
    description: 'Dyson Hair Straightener, alat pelurus rambut dengan teknologi canggih.',
    location: 'Jl. Ngagel Jaya Selatan No.11A',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Kecantikan',
  ),
  Product(
    imageUrl: 'assets/gitar_acoustic.jpg',
    title: 'Gitar Acoustic',
    description: 'Gitar acoustic dengan kualitas suara yang baik.',
    location: 'Jl. Jagir Wonokromo Wetan No. 3',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/sepeda_gunung.jpg',
    title: 'Sepeda Gunung',
    description: 'Sepeda gunung, ideal untuk petualangan di medan off-road.',
    location: 'Jl. Ngagel Jaya Selatan No.11A',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Olahraga',
  ),
  Product(
    imageUrl: 'assets/kamera_canon.jpg',
    title: 'Kamera Canon',
    description: 'Kamera Canon dengan fitur lengkap untuk fotografi profesional.',
    location: 'Jl. Jagir Wonokromo Wetan No. 3',
    mapsUrl: 'https://maps.app.goo.gl/5QCVZHzvN6vadAhk8',
    whatsappUrl: 'https://wa.me/6281235224294',
    category: 'Elektronik',
  ),
  
  Product(
    imageUrl: 'assets/puzzle.jpg',
    title: 'Puzzle 1000 Pieces',
    description: 'Puzzle dengan 1000 keping, ideal untuk mengisi waktu luang.',
    location: 'Jl. Bintara Jaya No. 5',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl1',
    whatsappUrl: 'https://wa.me/6281235224295',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/mie_instan.jpg',
    title: 'Indomie Goreng Aceh',
    description: 'Mie Goreng Aceh 5 bungkus exp 2025',
    location: 'Jl. Kalimantan No. 6',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl2',
    whatsappUrl: 'https://wa.me/6281235224296',
    category: 'Makanan',
  ),
  Product(
    imageUrl: 'assets/knitting_kit.jpeg',
    title: 'Knitting Kit',
    description: 'Kit lengkap untuk memulai hobi merajut.',
    location: 'Jl. Sumatra No. 7',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl3',
    whatsappUrl: 'https://wa.me/6281235224297',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/board_games.jpg',
    title: 'Board Game Collection',
    description: 'Koleksi board game untuk bermain bersama keluarga dan teman.',
    location: 'Jl. Bali No. 8',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl4',
    whatsappUrl: 'https://wa.me/6281235224298',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/action_figures.jpg',
    title: 'Action Figures',
    description: 'Koleksi action figures dari berbagai karakter populer.',
    location: 'Jl. Jawa No. 9',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl5',
    whatsappUrl: 'https://wa.me/6281235224299',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/rc_cars.jpg',
    title: 'RC Cars',
    description: 'Mobil remote control untuk balapan dan koleksi.',
    location: 'Jl. Sulawesi No. 10',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl6',
    whatsappUrl: 'https://wa.me/6281235224210',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/lego_sets.jpeg',
    title: 'LEGO Sets',
    description: 'Set LEGO berbagai tema untuk membangun kreativitas.',
    location: 'Jl. Papua No. 11',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl7',
    whatsappUrl: 'https://wa.me/6281235224211',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/paint_by_numbers.jpg',
    title: 'Paint by Numbers',
    description: 'Set melukis dengan angka, mudah digunakan untuk pemula.',
    location: 'Jl. Aceh No. 12',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl8',
    whatsappUrl: 'https://wa.me/6281235224212',
    category: 'Hobi',
  ),
  Product(
    imageUrl: 'assets/stamps_collection.jpeg',
    title: 'Stamps Collection',
    description: 'Koleksi perangko dari berbagai negara.',
    location: 'Jl. Lampung No. 13',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl9',
    whatsappUrl: 'https://wa.me/6281235224213',
    category: 'Aksesoris',
  ),
  Product(
    imageUrl: 'assets/model_kits.jpeg',
    title: 'Model Kits',
    description: 'Kit model untuk dirakit, termasuk pesawat, mobil, dan lainnya.',
    location: 'Jl. Maluku No. 14',
    mapsUrl: 'https://maps.app.goo.gl/exampleurl10',
    whatsappUrl: 'https://wa.me/6281235224214',
    category: 'Aksesoris',
  ),
];
