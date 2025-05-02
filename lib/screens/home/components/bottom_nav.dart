import 'package:flutter/material.dart';
import 'package:greenovate/constans/color.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Warna bayangan
              blurRadius: 10, // Seberapa kabur bayangannya
              offset: const Offset(0, -2), 
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, "Beranda", 0),
            _buildNavItem(Icons.menu_book, "Edukasi", 1),
            _buildNavItem(Icons.shopping_bag_outlined, "Shop", 2),
            _buildNavItem(Icons.groups, "Komunitas", 3),
            _buildNavItem(Icons.person_outlined, "Profile", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      color: AppColors.button,
                      shape: BoxShape.circle,
                    )
                  : const BoxDecoration(),
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                color: isActive ? Colors.white : AppColors.primary,
              ),
            ),
            const SizedBox(height: 1),
            if (!isActive)
              Text(
                label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
