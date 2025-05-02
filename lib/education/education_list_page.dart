import 'package:flutter/material.dart';
import 'package:greenovate/card/baca_card.dart';
import 'package:greenovate/constans/color.dart';

class EducationListPage extends StatelessWidget {
  const EducationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 70),
              const Text(
                'Artikel Terkini',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 0,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 16,
                    child: Image.asset('assets/images/mascot.png', height: 60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filterButton("Kerajinan (DIY)", selected: true),
                  const SizedBox(width: 8),
                  _filterButton("Kelas Online"),
                  const SizedBox(width: 8),
                  _filterButton("Limbah"),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Baca Card Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio:
                      0.75, // Bisa diatur sesuai tinggi yang diinginkan
                  children: const [
                    BacaCard(
                      image:  'assets/images/artikel.png',
                      title: 'Tips Mengolah Sampah Sederhana',
                      description: 'Sampah basah seperti sisa makanan dan ...',
                    ),
                    BacaCard(
                      image:  'assets/images/tigabotol.png',
                      title: 'Mengolah Sampah Dengan Cerdas',
                      description: 'Memilah sampah mungkin terdengar sepele...',
                    ),
                    BacaCard(
                      image:  'assets/images/artikel.png',
                      title: 'Yuk, Daur Ulang Barang Tak Terpakai!',
                      description:
                          'Di rumah, sering banget kita nemu barang...',
                    ),
                    BacaCard(
                      image:  'assets/images/artikel.png',
                      title: 'Yuk, Daur Ulang Barang Tak Terpakai!',
                      description:
                          'Di rumah, sering banget kita nemu barang...',
                    ),
                    BacaCard(
                      image:  'assets/images/artikel.png',
                      title: 'Yuk, Daur Ulang Barang Tak Terpakai!',
                      description:
                          'Di rumah, sering banget kita nemu barang...',
                    ),
                    BacaCard(
                      image:  'assets/images/artikel.png',
                      title: 'Yuk, Daur Ulang Barang Tak Terpakai!',
                      description:
                          'Di rumah, sering banget kita nemu barang...',
                    ),
                    // Tambah card lainnya di sini...
                  ],
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _filterButton(String label, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected ? const Color(0xFFFF9B50) : Colors.black,
        ),
        color: selected ? const Color(0xFFFF9B50) : Colors.white,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
