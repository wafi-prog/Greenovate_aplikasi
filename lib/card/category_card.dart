// category_card.dart
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final int itemCount;
  final String image;

  const CategoryCard({
    super.key,
    required this.label,
    required this.itemCount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 310,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black12, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text('$itemCount Dipasar', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          Image.asset(
            image,
            width: 230,
            height: 50,
            fit: BoxFit.cover,
            
          ),
        ],
      ),
    );
  }
}