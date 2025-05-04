import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:greenovate/card/article_card.dart';
import 'package:greenovate/card/baca_card.dart';
import 'package:greenovate/constans/color.dart';
import 'package:greenovate/education/education_list_page.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Education',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Stack(
                      clipBehavior:
                          Clip.none, // Allow the mascot to float above other elements
                      children: [
                        // TextField (Search Bar)
                        TextField(
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
                        // Mascot (kotset.svg) positioned in the top-right corner
                        Positioned(
                          top: -80,
                          right: 0, // Menempatkan ikon di sebelah kanan
                          child: SvgPicture.asset(
                            'assets/svg/kotset.svg',
                            width:
                                120, // Mengubah ukuran lebar ikon menjadi lebih besar
                            height: 95,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black45,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Color(0xFFFF9B50)),
                insets: EdgeInsets.symmetric(horizontal: 120.0),
              ),
              tabs: [Tab(text: 'Artikel'), Tab(text: 'Idea craft')],
            ),

            const SizedBox(height: 25),
            // Filter kategori horizontal
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

            // Isi tab
            Expanded(
              child: TabBarView(
                children: [
                  _buildArtikelTab(context),
                  const Center(child: Text("Konten Ideapedia Craft")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildArtikelTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          _sectionHeader(context, 'Artikel Terkini'),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ArticleCard(
                  image: 'assets/images/artikel.png',
                  title:
                      '5 Bahan yang Sering Kamu Buang Padahal Bisa Didaur Ulann',
                ),
                const SizedBox(width: 12),
                ArticleCard(
                  image: 'assets/images/artikel/mengelolasampah.png',
                  title:
                      'Dari Sampah Daur Ulang,Sukarelawan Membersihkan Sampah',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _sectionHeader(context, 'Baca Sekarang'),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BacaCard(
                  image: 'assets/images/artikel/manfaat.png',
                  title: 'Mengurangi Volume Sampah di TPA',
                  description: 'Sampah Yang Diolah Seringkali...',
                ),
                const SizedBox(width: 12),
                BacaCard(
                  image: 'assets/images/artikel/kontaminasi.png',
                  title: 'Dukungan Ekonomi Sirkular',
                  description: 'Sampah yang terpilah bisa dijadikan Bahan Baku',
                ),
                BacaCard(
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

  static Widget _sectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EducationListPage(),
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
