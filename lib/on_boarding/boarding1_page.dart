import 'package:flutter/material.dart';
import 'package:greenovate/on_boarding/boarding2_page.dart';


class Boarding1page extends StatelessWidget {
  const Boarding1page({super.key});

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
                 Image.asset('assets/images/fotoo.png'),
                  const SizedBox(height: 32),
                  const Text(
                    'Kenalan Yuk Sama Dunia Daur Ulang!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,  fontFamily: 'Plus Jakarta Display',),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                   'Di Grenov, kamu bisa belajar cara jaga bumi dengan cara yang seru dan gampang dipahami.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 24,
              left: 24,
              child: Row(
                children: [
                  buildIndicator(isActive: true),
                  const SizedBox(width: 6),
                  buildIndicator(isActive: false),
                  const SizedBox(width: 6),
                  buildIndicator(isActive: false),
                ],
              ),
            ),

            // Tombol skip
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

            // Tombol next
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                backgroundColor: const  Color(0xFFFF9B50),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Boarding2page()),
                  );
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white,),
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
        color: isActive ?  Color(0xFFFF9B50) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}