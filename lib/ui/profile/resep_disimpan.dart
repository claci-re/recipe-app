import 'package:flutter/material.dart';
import 'package:resep3_apk/ui/resep/resep_detail.dart';

class ResepDisimpanPage extends StatelessWidget {
  final List<Map<String, String>> resepList = [
    {
      'title': 'Pasta Aglio e Olio',
      'description': 'Pasta dengan bawang putih dan cabai.',
      'image': 'assets/images/pasta.jpg',
      'rating': '4.8',
      'author': 'Chef Maria',
      'ingredients': 'Pasta, Bawang Putih, Cabai, Minyak Zaitun',
      'steps':
          '1. Rebus pasta\n2. Tumis bawang putih dan cabai\n3. Campur dengan pasta\n4. Sajikan',
    },
    // Tambahkan resep lainnya di sini
  ];

  ResepDisimpanPage({super.key});

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
