import 'package:flutter/material.dart';
import 'resep_detail.dart';

class ResepPopulerPage extends StatelessWidget {
  final List<Map<String, String>> resepList = [
    {
      'title': 'Mie Goreng',
      'description': 'Mie goreng dengan bumbu pedas manis.',
      'image': 'assets/images/mie-goreng.jpg',
      'rating': '4.5',
      'author': 'MAZ ALIIE',
      'ingredients': 'Mie, Bawang, Kecap, Garam, Gula',
      'steps':
          '1. Rebus mie\n2. Tumis bumbu\n3. Campur mie dengan bumbu\n4. Sajikan',
    },
    {
      'title': 'Nasi Goreng',
      'description': 'Nasi goreng dengan telur dan ayam.',
      'image': 'assets/images/nasgor.jpg',
      'rating': '4.8',
      'author': 'Rusdi01',
      'ingredients': 'Nasi, Ayam, Telur, Kecap, Bawang',
      'steps':
          '1. Tumis bawang\n2. Masukkan ayam\n3. Tambahkan nasi\n4. Sajikan',
    },
    {
      'title': 'Sate Ayam',
      'description': 'Sate ayam dengan bumbu kacang.',
      'image': 'assets/images/sate-ayam.jpg',
      'rating': '4.7',
      'author': 'Aniez01',
      'ingredients': 'Ayam, Kacang, Kecap, Bawang, Cabai',
      'steps':
          '1. Potong ayam\n2. Buat bumbu kacang\n3. Tusuk ayam\n4. Panggang sate\n5. Sajikan',
    },
    {
      'title': 'Rendang',
      'description': 'Rendang daging sapi khas Padang.',
      'image': 'assets/images/rendang.jpg',
      'rating': '4.9',
      'author': 'Awul Awul',
      'ingredients': 'Daging sapi, Santan, Bumbu rendang',
      'steps':
          '1. Potong daging\n2. Masak dengan bumbu\n3. Tambahkan santan\n4. Sajikan',
    },
    {
      'title': 'Soto Ayam',
      'description': 'Soto ayam dengan kuah bening.',
      'image': 'assets/images/soto-ayam.jpg',
      'rating': '4.6',
      'author': 'SukaSoto',
      'ingredients': 'Ayam, Bawang, Jahe, Serai, Kunyit',
      'steps':
          '1. Rebus ayam\n2. Tumis bumbu\n3. Campur ayam dengan kuah\n4. Sajikan',
    },
    {
      'title': 'Bakso',
      'description': 'Bakso sapi dengan kuah kaldu.',
      'image': 'assets/images/bakso.jpg',
      'rating': '4.7',
      'author': 'Ainal Tuh',
      'ingredients': 'Daging sapi, Tepung, Bawang, Merica',
      'steps':
          '1. Buat adonan bakso\n2. Bentuk bulat\n3. Rebus bakso\n4. Sajikan dengan kuah',
    },
    {
      'title': 'Gado-Gado',
      'description': 'Gado-gado dengan bumbu kacang.',
      'image': 'assets/images/gado-gado.jpg',
      'rating': '4.5',
      'author': 'Eka Saputri',
      'ingredients': 'Sayuran, Kacang, Telur, Tempe',
      'steps':
          '1. Rebus sayuran\n2. Buat bumbu kacang\n3. Campur sayuran dengan bumbu\n4. Sajikan',
    },
    {
      'title': 'Nasi Uduk',
      'description': 'Nasi uduk dengan lauk pauk.',
      'image': 'assets/images/nasi-uduk.jpg',
      'rating': '4.8',
      'author': 'ZQBoyvers',
      'ingredients': 'Nasi, Santan, Bawang, Serai',
      'steps':
          '1. Masak nasi dengan santan\n2. Tambahkan lauk\n3. Sajikan dengan sambal',
    },
    {
      'title': 'Pecel Lele',
      'description': 'Pecel lele dengan sambal terasi.',
      'image': 'assets/images/pecel-lele.jpeg',
      'rating': '4.6',
      'author': 'Adam tuh',
      'ingredients': 'Lele, Sambal, Timun, Kemangi',
      'steps':
          '1. Goreng lele\n2. Buat sambal terasi\n3. Sajikan lele dengan sambal\n4. Tambahkan lalapan',
    },
    {
      'title': 'Ayam Goreng',
      'description': 'Ayam goreng dengan bumbu kuning.',
      'image': 'assets/images/ayam-goreng.jpg',
      'rating': '4.7',
      'author': 'SUka Lele',
      'ingredients': 'Ayam, Bumbu kuning, Bawang, Garam',
      'steps': '1. Marinasi ayam\n2. Goreng ayam\n3. Sajikan dengan sambal',
    },
    {
      'title': 'Capcay',
      'description': 'Capcay goreng dengan aneka sayuran.',
      'image': 'assets/images/capcay.jpeg',
      'rating': '4.5',
      'author': 'sAYa SUkA',
      'ingredients': 'Sayuran, Bawang, Saus tiram, Ayam',
      'steps':
          '1. Tumis bawang\n2. Masukkan sayuran\n3. Tambahkan saus tiram\n4. Sajikan dengan nasi',
    },
    {
      'title': 'Sop Buntut',
      'description': 'Sop buntut dengan kuah bening.',
      'image': 'assets/images/sop-buntut.jpg',
      'rating': '4.9',
      'author': 'Chef Aseli',
      'ingredients': 'Buntut sapi, Bawang, Wortel, Kentang',
      'steps':
          '1. Rebus buntut\n2. Tambahkan bumbu\n3. Masukkan sayuran\n4. Sajikan dengan nasi',
    },
  ];

  ResepPopulerPage({super.key});

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
