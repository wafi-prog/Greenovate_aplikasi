import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenovate/constans/color.dart';
import 'package:greenovate/forum/forum_chat_page.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FDF6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
          child: AppBar(
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFF4FDF6)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 29),
              child: Text(
                'Forum Diskusi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 292,
                  height: 90,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Yuk, jelajahi forum seru ini!\nBanyak kategori menarik yang bisa kamu temukan dan ikuti.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Kartu-kartu forum
            _buildForumCard(
              context,
              image: 'assets/images/mascot.png',
              title: 'Ngobrolin Bareng Komunitas',
              description:
                  'Kadang pengen ngobrol santai aja. Yuk, curhatin proses kreatifmu, cerita lucu, atau sekadar kenalan!',
            ),
            const SizedBox(height: 12),
            _buildForumCard(
              context,
              image: 'assets/images/Image.png',
              title: 'Lapak Kreasi Kamu',
              description:
                  'Punya karya keren dan pengen jualan? Di sini tempatnya promosi, tukar tips jualan, dan saling dukung.',
            ),
            const SizedBox(height: 12),
            _buildForumCard(
              context,
              image: 'assets/images/laut.png',
              title: 'Belajar Bareng DIY',
              description:
                  'Baru mulai atau mau upgrade skill? Yuk, belajar bareng lewat tips, tanya jawab, dan panduan praktis.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForumCard(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForumChatPage()),
        );
      },
      child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: 330,
          height: 100,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  child: Image.asset(
                    image,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover, 
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
