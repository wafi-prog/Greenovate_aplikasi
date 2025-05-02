import 'package:flutter/material.dart';

void showLaporkanDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Laporkan Toko Ini!"),
      content: const Text(
        "Jika kamu menemukan aktivitas mencurigakan, bantu kami menjaga keamanan Greenovate dengan melaporkannya.",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Oke, Saya Mengerti"),
        ),
      ],
    ),
  );
}
