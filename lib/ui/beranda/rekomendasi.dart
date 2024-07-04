import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class RekomendasiResepPage extends StatelessWidget {
  final List<String> rekomendasiResep = [
    'Nasi Goreng',
    'Sate Ayam',
    'Mie Goreng',
    'Ayam Bakar',
    'Soto Ayam',
    'Bakso',
  ];

  RekomendasiResepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Resep'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Swiper(
          itemCount: rekomendasiResep.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildSwiperItem(context, rekomendasiResep[index]);
          },
          pagination: const SwiperPagination(), // Optional: SwiperPagination()
          control: const SwiperControl(), // Optional: SwiperControl()
        ),
      ),
    );
  }

  Widget _buildSwiperItem(BuildContext context, String judulResep) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(0.0, 2.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://asset.kompas.com/crops/vmDriSafVxhO05gc2dSOXby53Mc=/13x7:700x465/750x500/data/photo/2021/09/24/614dc6865eb24.jpg', // Ganti dengan URL gambar resep
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black87, Colors.transparent],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                judulResep,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
