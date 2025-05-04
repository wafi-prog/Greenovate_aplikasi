import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenovate/forum/forum_chat_page.dart';  // Import svg

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
        title: Row(
          children: [
            const Text(
              'Forum',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/svg/kotset.svg',  // Path ke gambar Kotset
              width: 40,  // Ukuran gambar Kotset yang lebih kecil
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Kotak untuk pesan dengan batasan 3 baris
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yuk, jelajahi forum seru ini!\nBanyak kategori menarik yang bisa kamu temukan dan ikuti.',
                        style: const TextStyle(fontSize: 16),
                        maxLines: 3,  // Membatasi teks agar menjadi 3 baris
                        overflow: TextOverflow.ellipsis, // Jika teks lebih dari 3 baris, akan dipotong
                      ),
                    ],
                  ),
                ),
                // Kotset gambar
                Positioned(
                  right: 0, // Menempatkan gambar di kanan
                  top: 10,    // Menjaga gambar tetap sejajar di atas teks
                  child: SvgPicture.asset(
                    'assets/svg/kotset.svg',
                    width: 40,  // Ukuran gambar Kotset yang lebih kecil
                    height: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Kategori dengan gambar di sebelah kiri
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/mascot.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ngobrolin Bareng Komunitas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kadang pengen ngobrol santai aja. Yuk, curhatin proses kreatifmu, cerita lucu, atau sekadar kenalan!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Image.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Lapak Kreasi Kamu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Punya karya keren dan pengen jualan? Di sini tempatnya promosi, tukar tips/ulasan, dan saling dukung.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumChatPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/laut.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Belajar Bareng DIY',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Baru mulai atau mau upgrade skill? Yuk, belajar bareng lewat tips, tanya jawab, dan panduan praktis.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
