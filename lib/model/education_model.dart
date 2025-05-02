import 'package:flutter/material.dart';

class EducationArticle {
  final String title;
  final String subtitle;
  final String content;
  final String imageAsset;

  EducationArticle({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.imageAsset,
  });

  factory EducationArticle.fromMap(Map<String, dynamic> map) {
    return EducationArticle(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      content: map['content'] ?? '',
      imageAsset: map['imageAsset'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'imageAsset': imageAsset,
    };
  }
}

// List data dummy
final List<EducationArticle> articles = [
  EducationArticle(
    title: 'Cara Mengelola Sampah di Rumah',
    subtitle: 'Tips mudah untuk pemula',
    content:
        'Mengolah sampah nggak harus ribet, kok! Mulailah dengan memisahkan sampah basah dan kering. Sampah basah seperti sisa makanan dan sayuran bisa dikubur untuk jadi kompos. Sampah kering seperti botol plastik, kardus, atau kaleng bisa dikumpulkan lalu dijual ke bank sampah. Kalau ada botol bekas, bisa dimanfaatkan jadi pot tanaman atau tempat sabun cuci. Cukup dengan kebiasaan kecil ini, kita sudah bantu kurangi sampah dan menjaga lingkungan tetap bersih. Pisahkan Sampah Basah dan Kering Sampah basah: sisa makanan, kulit buah, sayuran Sampah kering: botol plastik, kardus, kaleng Jadikan Sampah Basah Sebagai Kompos Kubur di tanah atau masukkan ke ember komposter Gunakan untuk pupuk tanaman di rumah Kumpulkan Sampah Kering untuk Didaur Ulang Simpan dan jual ke bank sampah Bisa juga disumbangkan ke komunitas daur ulang Manfaatkan Barang Bekas Botol bekas jadi pot bunga Kaleng jadi tempat alat tulis atau sabun cuci Ajak Keluarga dan Tetangga Ikut Peduli Mulai dari rumah sendiri Semakin banyak yang sadar, lingkungan makin bersih! Yuk, mulai dari rumah sendiri dan ajak tetangga juga buat sama-sama peduli!',
    imageAsset: 'assets/images/banner1.png',
  ),
  EducationArticle(
    title: 'Kenali Jenis Sampah',
    subtitle: 'Sampah organik & anorganik',
    content:
        'Pelajari cara membedakan jenis sampah dan cara pengolahannya.',
    imageAsset: 'assets/images/banner2.png',
  ),
];
