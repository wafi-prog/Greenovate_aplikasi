import 'package:flutter/material.dart';
import 'package:greenovate/constans/color.dart';

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tentang Aplikasi",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FaqItem(
            question: "Apa itu Greenovate?",
            answer:
                "Greenovate adalah platform edukasi dan marketplace yang mendukung komunitas untuk belajar tentang daur ulang, mengelola karya kreatif dari limbah, serta membuka toko online untuk menjual produk ramah lingkungan.",
          ),
          FaqItem(
            question: "Bagaimana cara mendaftar di Greenovate?",
            answer:
                "Kamu bisa mendaftar dengan email aktif atau akun Google. Setelah itu, lengkapi profilmu dan mulai menjelajah fitur-fitur yang tersedia.",
          ),
          FaqItem(
            question: "Apa saja fitur utama di Greenovate?",
            answer:
                "• Marketplace: Unggah dan jual produk daur ulang.\n• Kelas Online: Belajar langsung dari para ahli dan kreator.\n• Toko Pribadi: Buka toko untuk mempromosikan karyamu.\n• Edukasi: Akses artikel, video, dan tips seputar daur ulang.",
          ),
          FaqItem(
            question: "Apakah saya bisa menjual limbah mentah?",
            answer:
                "Ya, kamu bisa menjual limbah yang telah dipilah dan siap didaur ulang. Pastikan mengikuti panduan dan kebijakan yang berlaku di platform.\n\nJika ingin menghapus akun, silakan kirim permintaan melalui email ke support@greenovate.id. Tim kami akan memproses permintaanmu dalam 3–5 hari kerja.",
          ),
          FaqItem(
            question: "Apakah ada biaya untuk menggunakan Greenovate?",
            answer:
                "Sebagian besar fitur dapat diakses gratis. Namun, untuk fitur premium seperti promosi toko atau akses ke kelas eksklusif, mungkin dikenakan biaya tertentu.",
          ),
          FaqItem(
            question: "Bagaimana cara menghubungi tim Greenovate?",
            answer:
                "Kamu bisa menghubungi kami melalui email: support@greenovate.id atau melalui fitur 'Hubungi Kami' di aplikasi.",
          ),
          FaqItem(
            question: "Bagaimana Ketika Terjadi Penipuan Toko?",
            answer:
                "Jika menemukan toko yang mencurigakan atau melakukan penipuan, kamu bisa melaporkannya ke email: support@greenovate.id.\nSertakan nama toko, bukti pendukung, dan penjelasan masalah. Tim kami akan menangani dan memproses laporan dalam 3–5 hari kerja.",
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _controller;
  late final Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  void _toggleExpand() {
    setState(() => _expanded = !_expanded);
    _expanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.key,
                    blurRadius:2,
                    // offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _arrowAnimation,
                    child: const Icon(Icons.expand_more, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF2F5F7),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Text(
                widget.answer,
                style: const TextStyle(fontSize: 14, color: AppColors.grey),
              ),
            ),
        ],
      ),
    );
  }
}