import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:greenovate/card/article_card.dart';
import 'package:greenovate/card/baca_card.dart';
import 'package:greenovate/card/idea_card.dart';
import 'package:greenovate/constans/color.dart';
import 'package:greenovate/education/education_list_page.dart';
import 'package:greenovate/ideascraft/idea_craft_page.dart';
import 'package:greenovate/ideascraft/ideacraft_list_page.dart'; // Import IdeaCraftPage

class IdeaCraftPage extends StatelessWidget {
  const IdeaCraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20), // Padding kiri dan kanan
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebar antara kiri dan kanan
              children: [
                const Text(
                  'Tutorial',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi saat klik "Lihat Semua"
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            // Isi tab
            Expanded(
              child: TabBarView(
                children: [
                  _buildArtikelTab(
                    context,
                  ), // Tab Artikel dengan filter DIY, Kelas Online, Limbah
                  const IdeaCraftPage(), // Tab Idea Craft dengan filter Mudah, Sedang, Sulit
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Artikel Tab content
  static Widget _buildArtikelTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter kategori hanya untuk Tab Artikel
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                 const SizedBox(width: 10),
                _filterButton("Mudah", selected: true),
                const SizedBox(width: 50),
                _filterButton("Sedang"),
                const SizedBox(width: 50),
                _filterButton("Sulit"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Artikel content (replace this with your article widgets)
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ArticleCard(
                  image: 'assets/images/artikel.png',
                  title: '5 Bahan yang Sering Kamu Buang Padahal Bisa Didaur Ulang',
                ),
                const SizedBox(width: 12),
                ArticleCard(
                  image: 'assets/images/artikel/mengelolasampah.png',
                  title: 'Dari Sampah Daur Ulang, Sukarelawan Membersihkan Sampah',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _sectionHeader(context, 'Step by Step', ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IdeaCard(
                  image: 'assets/images/artikel/manfaat.png',
                  title: 'Mengurangi Volume Sampah di TPA',
                  description: 'Sampah Yang Diolah Seringkali...',
                ),
                const SizedBox(width: 12),
                IdeaCard(
                  image: 'assets/images/artikel/kontaminasi.png',
                  title: 'Dukungan Ekonomi Sirkular',
                  description: 'Sampah yang terpilah bisa dijadikan Bahan Baku',
                ),
                IdeaCard(
                  image: 'assets/images/artikel/kontaminasi.png',
                  title: 'Dukungan Ekonomi Sirkular',
                  description: 'Sampah yang terpilah bisa dijadikan Bahan Baku',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _sectionHeader(context, 'Rekomendasi'),
          const SizedBox(height: 12),
          _listArticle(
            'assets/images/artikel/eco.png',
            'Membuat Kompos Mudah',
            'Sampah organik seperti sisa makanan dapat diubah jadi kompos...',
          ),
          _listArticle(
            'assets/images/artikel/pakan.png',
            'Eco-Enzyme',
            'Kulit buah atau sayur bisa difermentasi menjadi pembersih serbaguna...',
          ),
          _listArticle(
            'assets/images/artikel/terap.png',
            'Membuat Pakan Ternak',
            'Pakan ternak dari sisa makanan bisa jadi solusi alternatif nutrisi...',
          ),
          _listArticle(
            'assets/images/artikel/mengelolasampah.png',
            'Terapkan 3R: Reduce, Reuse, Recycle',
            'Kurangi sampah plastik dengan kebiasaan 3R di rumah...',
          ),
        ],
      ),
    );
  }

  // Filter Button widget
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

  // Section Header widget
  static Widget _sectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: title == 'Step by Step' ? 25 : 20),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IdeacraftListPage(),
              ),
            );
          },
          child: const Text(
            'Lihat Semua',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }

  // Recomendation Article List
  static Widget _listArticle(String img, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(img, width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: Text(title),
        subtitle: Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
