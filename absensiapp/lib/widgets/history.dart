import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HistoryPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Absen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/formal.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'AZWIR',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '19691227-2004-82-015',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuItem(Icons.access_time, 'Lembur'),
                  _buildMenuItem(Icons.edit, 'Izin'),
                  _buildMenuItem(Icons.history, 'Histori'),
                  _buildMenuItem(Icons.location_on, 'Lokasi'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: AbsenTable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.grey),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class AbsenTable extends StatelessWidget {
  const AbsenTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ToggleButtons(
            isSelected: const [true, false],
            onPressed: (index) {},
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Absen Harian'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Absen Lembur'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FixedColumnWidth(120),
            1: FixedColumnWidth(120),
            2: FixedColumnWidth(120),
          },
          children: const [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Tanggal', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Masuk', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pulang', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2024-07-22'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('09:21:59', style: TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('00:00:00'),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2024-07-25'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('07:30:47'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('16:09:35'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
