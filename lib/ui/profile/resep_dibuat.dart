import 'package:flutter/material.dart';
import 'package:resep3_apk/ui/resep/resep_detail.dart';

class ResepDibuatPage extends StatelessWidget {
  final List<Map<String, String>> resepList = [
    {
      'title': 'Nasi Goreng',
      'description': 'Nasi goreng dengan bumbu pedas.',
      'image': 'assets/images/nasi-goreng.jpg',
      'rating': '4.2',
      'author': 'Chef Ani',
      'ingredients': 'Nasi, Bawang, Kecap, Garam, Telur',
      'steps':
          '1. Tumis bawang\n2. Masukkan nasi dan bumbu\n3. Tambahkan telur\n4. Sajikan',
    },
    // Tambahkan resep lainnya di sini
  ];

  ResepDibuatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resepList.length,
      itemBuilder: (context, index) {
        final resep = resepList[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(
              resep['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(resep['description']!),
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
              ],
            ),
            trailing: Image.asset(
              resep['image']!,
              width: 100,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResepDetailPage(resep: resep),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
