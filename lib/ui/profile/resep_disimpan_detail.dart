import 'package:flutter/material.dart';

class ResepDisimpanDetailPage extends StatelessWidget {
  final String namaResep;
  final String deskripsiResep;
  final String imagePath;

  const ResepDisimpanDetailPage({
    Key? key,
    required this.namaResep,
    required this.deskripsiResep,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaResep),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(deskripsiResep),
          ],
        ),
      ),
    );
  }
}
