import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:resep3_apk/widget/bottombar.dart';
import 'package:resep3_apk/ui/beranda/rekomendasi.dart';
import 'package:resep3_apk/ui/resep/add_resep.dart';
import 'package:resep3_apk/ui/resep/search_resep.dart';
import 'package:resep3_apk/ui/profile/profile.dart'; // Import ProfileScreen

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const SearchResepPage(),
    const AddResepPage(),
    const ProfilePage(),
    RekomendasiResepPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddResepPage(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OrcaChef',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedIndex,
        onTabSelected: _onItemTapped,
      ),
    );
  }
}

class ProfileScreen {
  const ProfileScreen();
}

class HomeScreen extends StatelessWidget {
  final List<String> recipeImages = [
    'assets/images/nasgor.jpg',
    'assets/images/sop-iga.jpeg',
    'assets/images/mie-goreng.jpg',
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Rekomendasi Resep Hari Ini',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: Swiper(
              itemCount: recipeImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Image.asset(
                    recipeImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
            ),
          ),
          const SizedBox(height: 16), // Jarak antara swiper dan teks tambahan
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cari dan temukan resep dari komunitas OrcaChef',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Melalui fitur pencarian di OrcaChef, kamu dapat menemukan resep berdasarkan bahan atau nama hidangan, memastikan kamu selalu mendapat inspirasi masak setiap harinya.\n'
                  'Pengalaman ini bahkan lebih baik lagi dengan menggunakan aplikasi OrcaChef secara gratis!',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Resep Berdasarkan Bahan',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: <Widget>[
              ingredientBox('assets/images/ayam-potong.png', 'Ayam'),
              ingredientBox('assets/images/telor.png', 'Telur'),
              ingredientBox('assets/images/sosis.png', 'Sosis'),
              ingredientBox('assets/images/tempe.png', 'Tempe'),
              ingredientBox('assets/images/kentang.png', 'Kentang'),
              ingredientBox('assets/images/mie.png', 'Mie Instan'),
            ],
          ),
        ],
      ),
    );
  }

  Widget ingredientBox(String imageUrl, String label) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
