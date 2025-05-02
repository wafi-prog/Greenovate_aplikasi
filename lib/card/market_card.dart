// market_card.dart
import 'package:flutter/material.dart';

import 'package:greenovate/constans/color.dart';
import 'package:greenovate/screens/home/marketplace/detail_market_page.dart';

class MarketCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const MarketCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailMarketPage(), // Ganti sesuai kebutuhan
          ),
        );
      },
    child: Container(
      height: 220, // Menambahkan ukuran tinggi agar card lebih proporsional
      width: 166, // Menyesuaikan ukuran lebar card
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                height: 115,
              
                fit: BoxFit.cover,
              ),
            ),
            // Info Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 1), // Menambahkan jarak 35px di sini
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk tanyakan produk
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Tanyakan', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}