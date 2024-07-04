import 'package:flutter/material.dart';
import 'package:resep3_apk/ui/profile/resep_dibuat_detail.dart';
import 'package:resep3_apk/ui/profile/resep_disimpan_detail.dart';
import 'package:resep3_apk/ui/auth/login.dart'; // Import halaman login

class ProfilePage extends StatelessWidget {
  final String userName =
      'HAYO USER'; // Ganti dengan nama pengguna yang sebenarnya
  final int savedRecipesCount = 5; // Contoh jumlah resep yang disimpan
  final int createdRecipesCount = 10; // Contoh jumlah resep yang telah dibuat

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(
              4.0), // Sesuaikan padding agar logo lebih besar
          child: Image.asset(
            'assets/images/logo3.png', // Path ke logo
            width: 1000.0, // Sesuaikan lebar logo
            height: 1000.0, // Sesuaikan tinggi logo
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(''),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/profile3.jpg'), // Ganti dengan path foto profil
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  // Tambahkan Expanded di sini
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16.0,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4.0),
                          Flexible(
                            // Tambahkan Flexible di sini
                            child: Text(
                              'Brebes, Indonesia', // Ganti dengan lokasi pengguna
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Menambah TextOverflow
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Bergabung sejak Januari 2023', // Tanggal bergabung
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Resep yang Disimpan'),
            _buildRecipeCard(
              'assets/images/nasgor.jpg',
              'Nasi Goreng',
              'Deskripsi resep Nasi Goreng',
              () => _navigateToRecipeDetail(
                context,
                'Nasi Goreng',
                'assets/images/nasgor.jpg',
                'Deskripsi resep Nasi Goreng',
                true,
              ),
            ),
            _buildRecipeCard(
              'assets/images/sop-iga.jpeg',
              'Sop Iga',
              'Deskripsi resep Sop Iga',
              () => _navigateToRecipeDetail(
                context,
                'Sop Iga',
                'assets/images/sop-iga.jpeg',
                'Deskripsi resep Sop Iga',
                true,
              ),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Resep yang Dibuat'),
            _buildRecipeCard(
              'assets/images/mie-goreng.jpg',
              'Mie Goreng',
              'Deskripsi resep Mie Goreng',
              () => _navigateToRecipeDetail(
                context,
                'Mie Goreng',
                'assets/images/mie-goreng.jpg',
                'Deskripsi resep Mie Goreng',
                false,
              ),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Pengaturan'),
            _buildSettingsCard('Pengaturan Akun', Icons.settings, () {
              // Aksi ketika pengaturan akun ditekan
            }),
            _buildSettingsCard('Bantuan', Icons.help, () {
              // Aksi ketika bantuan ditekan
            }),
            _buildSettingsCard('Tentang Kami', Icons.info, () {
              // Aksi ketika tentang kami ditekan
            }),
            _buildSettingsCard('Logout', Icons.logout, () {
              _navigateToLogin(context); // Panggil navigasi ke halaman login
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
      String imagePath, String title, String description, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.0,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 12.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToRecipeDetail(BuildContext context, String recipeName,
      String imagePath, String description, bool isSaved) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isSaved
            ? ResepDisimpanDetailPage(
                namaResep: recipeName,
                deskripsiResep: description,
                imagePath: imagePath,
              )
            : ResepDibuatDetailPage(
                namaResep: recipeName,
                deskripsiResep: description,
                imagePath: imagePath,
              ),
      ),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LoginPage(), // Ganti dengan halaman login yang sebenarnya
      ),
    );
  }
}
