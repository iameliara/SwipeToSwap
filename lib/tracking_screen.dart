import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'homescreen.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class ModelKota {
  final String cityId;
  final String cityName;
  final String type;

  ModelKota({
    required this.cityId,
    required this.cityName,
    required this.type,
  });

  factory ModelKota.fromJson(Map<String, dynamic> json) {
    return ModelKota(
      cityId: json['city_id'],
      cityName: json['city_name'],
      type: json['type'],
    );
  }

  static List<ModelKota> fromJsonList(List list) {
    return list.map((item) => ModelKota.fromJson(item)).toList();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? strKotaAsal;
  String? strKotaTujuan;
  String? strBerat;
  String? strEkspedisi;
  final client = http.Client();

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  List<ModelKota> localCities = [
    ModelKota(cityId: "1", cityName: "Jakarta", type: "Kota"),
    ModelKota(cityId: "2", cityName: "Bandung", type: "Kota"),
    ModelKota(cityId: "3", cityName: "Surabaya", type: "Kota"),
    ModelKota(cityId: "4", cityName: "Medan", type: "Kota"),
    ModelKota(cityId: "5", cityName: "Palembang", type: "Kota"),
    ModelKota(cityId: "6", cityName: "Semarang", type: "Kota"),
    ModelKota(cityId: "7", cityName: "Yogyakarta", type: "Kota"),
    ModelKota(cityId: "8", cityName: "Makassar", type: "Kota"),
    ModelKota(cityId: "9", cityName: "Balikpapan", type: "Kota"),
    ModelKota(cityId: "10", cityName: "Denpasar", type: "Kota"),
  ];

  Future<List<ModelKota>> fetchCities() async {
    try {
      print('Fetching cities...');
      var response = await client.get(Uri.parse("https://api.rajaongkir.com/starter/city?key=d0f1322e891318d94855aed87086c56f"));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List allKota = (jsonDecode(response.body) as Map<String, dynamic>)['rajaongkir']['results'];
        var dataKota = ModelKota.fromJsonList(allKota);
        return dataKota;
      } else {
        print('Failed to load cities: ${response.reasonPhrase}');
        throw Exception('Failed to load cities: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching cities: $e');
      return localCities; 
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Detail Ongkir'),
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
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset(
              'assets/tracking.jpg', 
              height: 300, 
              width: double.infinity,
              fit: BoxFit.none,
            ),
            SizedBox(height: 5), 
            DropdownSearch<ModelKota>(
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Kota Asal",
                  hintText: "Pilih Kota Asal",
                ),
              ),
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) {
                setState(() {
                  strKotaAsal = value?.cityId;
                });
              },
              itemAsString: (item) => "${item.type} ${item.cityName}",
              asyncItems: (text) async {
                try {
                  return await fetchCities();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching cities: $e')));
                  return localCities; 
                }
              },
            ),
            const SizedBox(height: 20),
            DropdownSearch<ModelKota>(
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Kota Tujuan",
                  hintText: "Pilih Kota Tujuan",
                ),
              ),
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) {
                setState(() {
                  strKotaTujuan = value?.cityId;
                });
              },
              itemAsString: (item) => "${item.type} ${item.cityName}",
              asyncItems: (text) async {
                try {
                  return await fetchCities();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching cities: $e')));
                  return localCities; 
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Berat Paket (gram)",
                hintText: "Input Berat Paket",
              ),
              onChanged: (text) {
                setState(() {
                  strBerat = text;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownSearch<String>(
              items: const ["JNE", "TIKI", "POS"],
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Kurir",
                  hintText: "Kurir",
                ),
              ),
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              onChanged: (text) {
                setState(() {
                  strEkspedisi = text?.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 31, 78, 116)),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (strKotaAsal == null || strKotaTujuan == null || strBerat == null || strEkspedisi == null) {
                          const snackBar = SnackBar(content: Text("Ups, form tidak boleh kosong!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                kota_asal: strKotaAsal,
                                kota_tujuan: strKotaTujuan,
                                berat: strBerat,
                                kurir: strEkspedisi,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Cek Ongkir",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String? kota_asal;
  final String? kota_tujuan;
  final String? berat;
  final String? kurir;

  const DetailPage(
      {super.key, this.kota_asal, this.kota_tujuan, this.berat, this.kurir});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Map<String, dynamic>> listData = [];
  var strKey = "d0f1322e891318d94855aed87086c56f";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await http.post(
        Uri.parse("https://api.rajaongkir.com/starter/cost"),
        body: {
          "key": strKey,
          "origin": widget.kota_asal,
          "destination": widget.kota_tujuan,
          "weight": widget.berat,
          "courier": widget.kurir
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final results = jsonResponse['rajaongkir']['results'][0]['costs'];
        setState(() {
          listData = results.map<Map<String, dynamic>>((cost) {
            return {
              'service': cost['service'],
              'description': cost['description'],
              'cost': cost['cost'][0]['value'],
              'etd': cost['cost'][0]['etd'],
            };
          }).toList();
        });
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
        setState(() {
          listData = [
            {
              'service': 'REG',
              'description': 'Layanan Reguler',
              'cost': 8000,
              'etd': '2-3'
            },
          ];
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        listData = [
          {
            'service': 'REG',
            'description': 'Layanan Reguler',
            'cost': 8000,
            'etd': '2-3'
          },
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Detail Ongkos Kirim ${widget.kurir.toString().toUpperCase()}"),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.kurir!.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    listData[index]['service'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp ${listData[index]['cost']}",
                    style: const TextStyle(
                        fontSize: 20, color: Colors.purple),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listData[index]['description']),
                  Text("${listData[index]['etd']} Days"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
