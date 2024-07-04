import 'package:flutter/material.dart';

class ResepDetailPage extends StatelessWidget {
  final Map<String, String> resep;

  const ResepDetailPage({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep['title']!),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                resep['image']!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                resep['title']!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(resep['rating']!),
                  const SizedBox(width: 16),
                  const Icon(Icons.person, size: 16),
                  const SizedBox(width: 4),
                  Text(resep['author']!),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Deskripsi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(resep['description']!),
              const SizedBox(height: 16),
              const Text(
                'Bahan-bahan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(resep['ingredients']!),
              const SizedBox(height: 16),
              const Text(
                'Langkah-langkah:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(resep['steps']!),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Implementasi penyimpanan resep
                  },
                  icon: const Icon(Icons.bookmark, color: Colors.white),
                  label: const Text(
                    'Simpan Resep',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 153, 0),
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
