import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            const Text(
              'Kebijakan Privasi',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Text(
              'Terakhir diupdate April 2025',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 12),
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _SectionTitle(title: '1. Data Pribadi'),
            Text(
              'Kami hanya mengumpulkan data yang kamu berikan saat mendaftar, seperti nama, email, dan informasi toko jika kamu membuka toko dalam aplikasi.',
            ),
            SizedBox(height: 12),
            _SectionTitle(title: '2. Penggunaan Data'),
            Text('Data kamu digunakan untuk:\n'
                '• Membuat akun dan profil pengguna\n'
                '• Menampilkan karya dan toko di marketplace\n'
                '• Mengelola transaksi dan kelas online'),
            SizedBox(height: 12),
            _SectionTitle(title: '3. Keamanan Data'),
            Text(
              'Kami menjaga data pribadimu dengan sistem keamanan yang sesuai. Kami tidak menjual atau membagikan datamu ke pihak ketiga tanpa izin.',
            ),
            SizedBox(height: 12),
            _SectionTitle(title: '4. Kontrol Pengguna'),
            Text(
              'Jika kamu ingin menghapus akun atau datamu, kamu bisa menghubungi kami melalui email: support@greenovate.id. '
              'Tim kami akan bantu proses penghapusan akun dalam 3–5 hari kerja.',
            ),
            SizedBox(height: 12),
            _SectionTitle(title: '5. Persetujuan'),
            Text(
              'Dengan mencentang kotak ini dan melanjutkan pendaftaran, kamu menyetujui kebijakan privasi Greenovate.',
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.check_box_outline_blank, color: Colors.black87),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Dengan mendaftar, Anda menyetujui Kebijakan Privasi Kami',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
