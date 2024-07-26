import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Karyawan'),
        // backgroundColor: Colors.blue, // Warna biru biasa
      ),
      body: ListView(
        children: [
          // Bagian atas dengan gambar profil dan nama
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue, // Warna biru biasa
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/formal.jpg'), // Ganti dengan path gambar profil
                ),
                const SizedBox(height: 10),
                const Text(
                  'Messy Wirdianti',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '19701211-2003-17-011',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Informasi profil
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Informasi Profil',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.phone, color: Colors.blue),
                          title: Text('Nomor Telepon'),
                          subtitle: Text('+62 82170395745'),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.blue),
                          title: Text('Alamat'),
                          subtitle: Text('Jl. Rohana Kudus Padang Panjang'),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.calendar_today, color: Colors.blue),
                          title: Text('Tanggal Lahir'),
                          subtitle: Text('17 Januari 2003'),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.assignment_ind, color: Colors.blue),
                          title: Text('Status'),
                          subtitle: Text('Pegawai Magang'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pengaturan Akun',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.lock, color: Colors.blue),
                          title: const Text('Ubah Kata Sandi'),
                          onTap: () {
                            // Aksi untuk ubah kata sandi
                          },
                        ),
                        // const Divider(),
                        // ListTile(
                        //   leading: const Icon(Icons.logout, color: Colors.blue),
                        //   title: const Text('Keluar'),
                        //   onTap: () {
                        //     // Aksi untuk keluar dari akun
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
