import "package:flutter/material.dart";

class CVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar Belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lapisan Gradien untuk meningkatkan keterbacaan teks
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),

          // Konten utama dengan tampilan gulir
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Kartu Profil dengan Bayangan
                  _buildProfileCard(),
                  SizedBox(height: 30), // Jarak antar bagian

                  // Kartu Bagian untuk Pendidikan, Pengalaman, Keterampilan
                  _buildSectionCard(
                    context,
                    icon: Icons.school,
                    title: 'Pendidikan',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _educationTile('Diploma III', 'Politeknik Sukabumi', '2024-2025'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Jarak antar bagian
                  _buildSectionCard(
                    context,
                    icon: Icons.work,
                    title: 'Pengalaman',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _experienceTile(
                          'Pengembang Perangkat Lunak',
                          'Membuat projek iot yang berjudul alat penyortir uang logam',
                          'pada projek akhir semester 4',
                          'Mengembangkan dan memelihara aplikasi web dan mobile menggunakan Flutter dan teknologi lainnya.',
                        ),
                        _experienceTile(
                          'Menjabat Sebagai Departemen Eksternal di Himpunan Kampus',
                          'Mengikuti Penuh Kegiatan Permikomnas',
                          'Pada tanggal 11 September 2023 Di UIN Sunan Gunung Djati Bandung',
                          'Membantu dan Memfasilitasi anggota himpunan untuk membangun relasi dengan pihak Eksternal.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Jarak antar bagian
                  _buildSectionCard(
                    context,
                    icon: Icons.code,
                    title: 'Keterampilan',
                    content: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      children: [
                        _skillChip('Flutter'),
                        _skillChip('Dart'),
                        _skillChip('JavaScript'),
                        _skillChip('Laravel'),
                        _skillChip('HTML & CSS'),
                        _skillChip('PHP Native'),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),

                  // Footer
                  Text(
                    'Terima kasih telah meninjau CV saya!',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Kartu Profil
  Widget _buildProfileCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade300, Colors.green.shade300],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Gambar Profil
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile.JPG'),
            ),
            SizedBox(height: 20),

            // Bagian Informasi Pribadi
            Text(
              'Irman Nurhakim',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Pengembang Perangkat Lunak',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Informasi Kontak dengan Ikon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text('irmnnrhkm@gmail.com', style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text('082123433751', style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Kartu Bagian
  Widget _buildSectionCard(BuildContext context, {required IconData icon, required String title, required Widget content}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade200, Colors.green.shade200],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(thickness: 2, color: Colors.black.withOpacity(0.7)),
            SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }

  // Widget untuk membangun item pendidikan
  Widget _educationTile(String degree, String institution, String year) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(institution, style: TextStyle(color: Colors.black)),
          Text(year, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  // Widget untuk membangun item pengalaman
  Widget _experienceTile(String position, String company, String duration, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text('$company ($duration)', style: TextStyle(color: Colors.black)),
          Text(description, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  // Widget untuk membangun chip keterampilan
  Widget _skillChip(String skill) {
    return Chip(
      label: Text(skill, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.blue.shade400,
    );
  }
}