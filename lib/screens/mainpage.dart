import 'package:flutter/material.dart';
import 'package:greenovate/forum/forum_page.dart';
import 'package:greenovate/profile/profile_page.dart';
import 'package:greenovate/screens/home/components/bottom_nav.dart';
import 'package:greenovate/education/education_page.dart';
import 'package:greenovate/screens/home/home_page.dart';
import 'package:greenovate/screens/home/marketplace/marketplace_page.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  final bool showProfileSnackbar;

  const MainPage({
    Key? key,
    this.initialIndex = 0,
    this.showProfileSnackbar = false,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.initialIndex;

    _pages = [
      const HomePage(),
      const EducationPage(),
      const MarketplacePage(), // ShopPage nanti
      const ForumPage(),
      ProfilePage(shouldShowSnackbar: widget.showProfileSnackbar),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}