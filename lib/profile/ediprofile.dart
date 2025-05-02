import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDF4), // latar belakang hijau muda
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF589E52),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Edit Profile',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
        ),
      ),

      body: Stack(
        children: [
          // ================== PUTIHAN FORM ==================
          Positioned.fill(
            top: 160,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 5), // buat ruang buat avatar & ID
                    buildTextField(label: 'Tentang Toko', maxLines: 3,hintText: 'Isi Tentang Tokomu'),
                    const SizedBox(height: 16),
                    buildTextField(label: 'Nama Pengguna', hintText: 'Herman William'),
                    const SizedBox(height: 16),
                    buildTextField(label: 'Email', hintText: 'HermanWilliam@gmail.com'),
                    const SizedBox(height: 16),
                    buildTextField(label: 'No. HP', hintText: '0857782345876'),
                    const SizedBox(height: 16),
                    buildTextField(
                      label: 'Kata Sandi',
                      obscureText: true,
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ================== AVATAR BULAT ==================
          Positioned(
            top: 15,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.white,
            ),
          ),

          // ================== ICON CAMERA ==================
          Positioned(
            top: 75,
            left: MediaQuery.of(context).size.width / 2 + 10,
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.green,
              child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
            ),
          ),

          // ================== ID PENGGUNA ==================
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'ID Pengguna : 1234567890',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================== FUNGSI TEXT FIELD ==================
  Widget buildTextField({
    required String label,
    String? hintText,
    int maxLines = 1,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}