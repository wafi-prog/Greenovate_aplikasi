import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Import flutter_svg
import 'package:greenovate/card/article_card.dart';
import 'package:greenovate/card/product_card.dart';
import 'package:greenovate/constans/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  final List<String> bannerImages = [
    'assets/images/artikel/foto1.png',
    'assets/images/artikel/foto2.png',
    'assets/images/artikel/foto3.png',
    'assets/images/artikel/foto4.png',
    'assets/images/artikel/foto3.png',
  ];

  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-slide banner setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // jangan lupa matikan timer biar nggak bocor memori
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER ===
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/green.png'),
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat datang',
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            'Harman William',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Memindahkan ikon mascot di atas tombol pencarian
                  Stack(
                    clipBehavior: Clip.none, // Agar ikon tidak terpotong
                    children: [
                      // Tombol pencarian
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari produk ramah lingkungan',
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
                      // Ikon mascot di sebelah kanan atas menggunakan SVG
                      Positioned(
                        top: -80,
                        right: 0, // Menempatkan ikon di sebelah kanan
                        child: SvgPicture.asset(
                          'assets/svg/kotset.svg',
                          width: 120,  // Mengubah ukuran lebar ikon menjadi lebih besar
                          height: 95
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // === KONTEN UTAMA ===
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // === BANNER ===
                  Column(
                    children: [
                      SizedBox(
                        height: 160,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: bannerImages.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },

                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(bannerImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: bannerImages.length,
                          effect: const WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Colors.blueAccent,
                            dotColor: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // === PRODUK TERPOPULER ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Produk Terpopuler',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 400,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        ProductCard(
                          title: 'Kotak Pensil Ajaib',
                          price: 'Rp. 30.000',
                          image: 'assets/images/tigabotol.png',
                        ),
                        ProductCard(
                          title: 'Kotak Pensil Mini',
                          price: 'Rp. 40.000',
                          image: 'assets/images/kucingoren.png',
                        ),
                        ProductCard(
                          title: 'Tas Rainbow',
                          price: 'Rp. 20.000',
                          image: 'assets/images/mi.png',
                        ),
                        ProductCard(
                          title: 'Kotak Kumbang',
                          price: 'Rp. 30.000',
                          image: 'assets/images/kumbang.png',
                        ),
                      ],
                    ),
                  ),

                  // === ARTIKEL TERKINI ===
                  const Text(
                    'Artikel Terkini',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ArticleCard(
                          image: 'assets/images/artikel.png',
                          title:
                              '5 Bahan yang Sering Kamu Buang Padahal Bisa Didaur Ulang',
                        ),
                        const SizedBox(width: 12),
                        ArticleCard(
                          image: 'assets/images/artikel/mengelolasampah.png',
                          title:
                              'Dari Sampah Daur Ulang, Sukarelawan Membersihkan Sampah',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
