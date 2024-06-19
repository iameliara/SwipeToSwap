import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Penulis {
  String imageUrl;
  String name;
  String ttl;
  String address;
  String phone;
  String email;
  String github;
  List<String> educations;

  Penulis(this.imageUrl, this.name, this.ttl, this.address, this.phone, this.email, this.github, this.educations);

  static List<Penulis> data = [
    Penulis(
      'assets/amel1.png',
      '[ Amelia Rizki Andini ]',
      'Surabaya, 15 Mei 2004',
      'Jln. Dukuh Setro V no 56',
      '+62 821-9259-5042',
      '22082010086@student.upnjatim.ac.id',
      'https://github.com/iameliara',
      [
        'MTSN 1 Sidoarjo',
        'SMAN 4 Surabaya',
        'UPN "Veteran" Jawa Timur',
      ],
    ),
    Penulis(
      'assets/ammor2.jpg',
      '[ Ammorhita Azza Natania Ertri ]',
      'Mojokerto, 23 Desember 2003',
      'Perum. Puri Asri Jl.Merak Blok G2 NO. 15, Dsn. Tambak Suruh, Ds. Tambakagung, Kec. Puri, Kab. Mojokerto, Jawa Timur',
      '+62 812-3522-4294',
      '22082010082@student.upnjatim.ac.id',
      'https://github.com/ammoranee',
      [
        'SMPN 1 Puri',
        'SMAN 2 Mojokerto',
        'UPN "Veteran" Jawa Timur',
      ],
    ),
  ];
}

class DetailPenulis extends StatelessWidget {
  final Penulis author1;
  final Penulis author2;

  const DetailPenulis({Key? key, required this.author1, required this.author2}) : super(key: key);

  Widget buildAuthorDetail(Penulis author) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         if (author.name == '[ Amelia Rizki Andini ]')
        Container(
          padding: EdgeInsets.all(18.0),
          color: Color.fromARGB(255, 61, 77, 123),
          child: Text(
            '🔍 Tim Pengembang 🔎',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 14),
        CircleAvatar(
          radius: 90,
          backgroundImage: AssetImage(author.imageUrl),
        ),
        SizedBox(height: 10),
        Text(
          author.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '📍 Tempat, Tanggal Lahir',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            author.ttl,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '📌 Alamat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            author.address,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '📞 No. HP',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),   
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            author.phone,
            style: TextStyle(
            ),
          ),
        ), 
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '📧 Email',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),   
        Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            launch('mailto:${author.email}');
          },
          child: Text(
            author.email,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '🔗 Github',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              launch(author.github);
            },
            child: Text(
              author.github,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '🎓 Pendidikan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: author.educations.length,
          itemBuilder: (BuildContext context, int index) {
            final education = author.educations[index];
            return Text('${index + 1}. $education');
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Penulis'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildAuthorDetail(author1),
                buildAuthorDetail(author2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthorsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Penulis'),
      ),
      body: ListView.builder(
        itemCount: Penulis.data.length,
        itemBuilder: (context, index) {
          final author = Penulis.data[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(author.imageUrl),
            ),
            title: Text(author.name),
            subtitle: Text(author.ttl),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPenulis(author1: Penulis.data[0], author2: Penulis.data[1]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

