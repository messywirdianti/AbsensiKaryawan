import 'package:flutter/material.dart';

class JamKerja extends StatefulWidget {
  const JamKerja({super.key});

  @override
  State<JamKerja> createState() => _JamKerjaState();
}

class _JamKerjaState extends State<JamKerja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jam Kerja Karyawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the column contents
          children: [
            Align(
              alignment:
                  Alignment.topCenter, // Align the container to the top center
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.95, // 95% of screen width
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Add horizontal padding
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 40.0, // Increase space between columns
                    headingRowHeight: 56.0, // Increase heading row height
                    dataRowHeight: 60.0, // Increase data row height
                    columns: [
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              '#',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Hari',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Pulang',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.green[100]!),
                        cells: const [
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('Senin'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.green[100]!),
                        cells: const [
                          DataCell(Center(child: Text('2'))),
                          DataCell(Center(child: Text('Selasa'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                      DataRow(
                        cells: const [
                          DataCell(Center(child: Text('3'))),
                          DataCell(Center(child: Text('Rabu'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                      DataRow(
                        cells: const [
                          DataCell(Center(child: Text('4'))),
                          DataCell(Center(child: Text('Kamis'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                      DataRow(
                        cells: const [
                          DataCell(Center(child: Text('5'))),
                          DataCell(Center(child: Text('Jumat'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:30:00'))),
                        ],
                      ),
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.red[100]!),
                        cells: const [
                          DataCell(Center(child: Text('6'))),
                          DataCell(Center(child: Text('Sabtu'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.red[100]!),
                        cells: const [
                          DataCell(Center(child: Text('7'))),
                          DataCell(Center(child: Text('Minggu'))),
                          DataCell(Center(child: Text('07:30:59'))),
                          DataCell(Center(child: Text('16:00:00'))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2), // Add Spacer to balance the layout
          ],
        ),
      ),
    );
  }
}
