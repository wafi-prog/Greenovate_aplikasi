import 'package:flutter/material.dart';

import 'package:greenovate/card/forum_card.dart';
import 'package:greenovate/forum/forum_chat_page.dart';


class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FDF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A6936),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Forum',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Arahkan ke halaman baru saat card pertama ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(
                      // title: 'Ngobrolin Bareng Komunitas',
                    ),
                  ),
                );
              },
              child: const ForumCard(
                title: 'Ngobrolin Bareng Komunitas',
                description:
                    'Kadang pengen ngobrol santai aja. Yuk, curhatin proses kreatifmu, cerita lucu, atau sekadar kenalan!',
                // imagePath: 'assets/images/forum1.png',
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Arahkan ke halaman baru saat card kedua ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(
                      // title: 'Lapak Kreasi Kamu',
                    ),
                  ),
                );
              },
              child: const ForumCard(
                title: 'Lapak Kreasi Kamu',
                description:
                    'Punya karya keren dan pengen jualan? Di sini tempatnya promosi, tukar tips/ulasan, dan saling dukung.',
                // imagePath: 'assets/images/forum2.png',
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Arahkan ke halaman baru saat card ketiga ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(
                      // title: 'Belajar Bareng DIY',
                    ),
                  ),
                );
              },
              child: const ForumCard(
                title: 'Belajar Bareng DIY',
                description:
                    'Barumulai atau mau upgrade skill? Yuk, belajar bareng lewat tips, tanya jawab, dan panduan praktis.',
                // imagePath: 'assets/images/forum3.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman detail baru yang akan dituju