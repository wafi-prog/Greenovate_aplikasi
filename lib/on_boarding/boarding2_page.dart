import 'package:flutter/material.dart';
import 'package:greenovate/on_boarding/boarding3_page.dart';

class Boarding2page extends StatelessWidget {
  const Boarding2page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FDF6),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/green.png'),
                  const SizedBox(height: 32),
                  const Text(
                    'Peduli Lingkungan, Dapat Cuan Bareng Grenovate!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Yuk daur ulang bareng Greenove, bisa jaga lingkungan sekaligus dapetin reward seru tiap hari!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // INI indikator di pojok kiri bawah
            Positioned(
              bottom: 24,
              left: 24,
              child: Row(
                children: [
                  buildIndicator(isActive: false),
                  const SizedBox(width: 6),
                  buildIndicator(isActive: true),
                  const SizedBox(width: 6),
                  buildIndicator(isActive: false),
                ],
              ),
            ),
            Stack(
              children: [
                // Tombol "Balik" (ikon panah) di pojok kiri atas
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () {
                    Navigator.pushNamed(context, '/boarding1');
                    },
                  ),
                ),
                // Tombol "Skip" di pojok kanan atas
                Positioned(
                  top: 16,
                  right: 16,
                  child: TextButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF1A73E8),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Boarding3page(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator({required bool isActive}) {
    return Container(
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
