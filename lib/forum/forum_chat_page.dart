import 'package:flutter/material.dart';
import 'package:greenovate/constans/color.dart';

class ForumChatPage extends StatelessWidget {
  const ForumChatPage({super.key});

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
                'Ngobrol Bareng Yuk !',
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(32),
              children: const [
                // Post utama (kotak hijau)
                PostBubble(
                  name: 'Mariana Hetlie',
                  content:
                      'Halo semua! Aku baru coba bikin tempat pensil dari kaleng bekas dan tali rami. Seru banget, hasilnya juga estetik 😍 Ada yang mau coba juga?',
                  time: '15.27',
                  isHighlight: true,
                ),
                SizedBox(height: 16),
                ChatBubble(
                  name: 'Mariana Hetlie',
                  message:
                      '@TitaCrafts Keren! Boleh dong share step-step-nya atau video singkatnya. Lagi nyari ide buat kegiatan workshop sekolah minggu depan nih',
                  time: '15.27',
                ),
                SizedBox(height: 12),
                ChatBubble(
                  name: 'Miskah Wersie',
                  message:
                      '@miskah Barusan upload hasil DIY wall decor dari kardus bekas, loh. Boleh cek dan kasih masukan ya! ✨',
                  time: '15.27',
                ),
              ],
            ),
          ),
          const MessageInputBar(),
        ],
      ),
    );
  }
}

class PostBubble extends StatelessWidget {
  final String name;
  final String content;
  final String time;
  final bool isHighlight;

  const PostBubble({
    super.key,
    required this.name,
    required this.content,
    required this.time,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isHighlight ? const Color.fromARGB(255, 0, 49, 8) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const ChatBubble({
    super.key,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(message, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              time,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInputBar extends StatelessWidget {
  const MessageInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Kirim Komentar Mu',
                  hintStyle: const TextStyle(fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.image, color: Color(0xFF3A6936)),
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: const Color(0xFF3A6936),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
