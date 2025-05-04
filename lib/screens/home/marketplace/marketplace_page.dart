import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:greenovate/card/category_card.dart';
import 'package:greenovate/card/market_card.dart';
import 'package:greenovate/screens/home/marketplace/market_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  Timer? _timer;

  final List<String> bannerImages = [
    'assets/images/banner2.png',
    'assets/images/banner1.png',
    'assets/images/banner3.png',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Header ===
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF3A6936),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile dan Nama
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'assets/images/mascot.png',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Selamat datang',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Harman William',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      clipBehavior: Clip.none,  // Allow mascot to overlap
                      children: [
                        // TextField (Search Bar)
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari produk ramah lingkungan',
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
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
                          width: 120,  // Mengubah ukuran lebar ikon menjadi lebih besar
                          height: 95
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // === Kategori ===
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Kategori',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    CategoryCard(
                      label: 'Limbah',
                      itemCount: 254,
                      image: 'assets/images/laut.png',
                    ),
                    SizedBox(width: 12),
                    CategoryCard(
                      label: 'DIY',
                      itemCount: 83,
                      image: 'assets/images/origami.png',
                    ),
                    SizedBox(width: 12),
                    CategoryCard(
                      label: 'Kelas Online',
                      itemCount: 56,
                      image: 'assets/images/lampu.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // === Banner ===
              SizedBox(
                height: 160,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: bannerImages.length,
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
                    activeDotColor: Colors.green,
                    dotColor: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // === Rekomendasi ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    const Text(
                      'Rekomendasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Ganti 'NamaHalamanLain' dengan nama halaman yang ingin dituju
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarketPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(color: Color(0xFF3A6936)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const MarketCard(
                    title: 'Pot Kulit Telur',
                    price: 'Rp. 20.000',
                    image: 'assets/images/mi.png',
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
