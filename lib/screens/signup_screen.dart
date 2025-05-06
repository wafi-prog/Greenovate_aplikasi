import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenovate/auth/bloc/register/register_bloc.dart';
import 'package:greenovate/constans/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isAgreed = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telponController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text("Registrasi berhasil!")),
              );
              Navigator.pushReplacementNamed(context, '/home');
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Gagal: $msg")),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                    ),
                    const SizedBox(width: 25),
                    Image.asset('assets/images/white.png', width: 220, height: 46),
                  ],
                ),
              ),

              // Bottom Container
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFFF3FFF6),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Yuk, mulai\npetualangan hijaumu!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Image.asset('assets/images/mascot.png', height: 100),
                            ],
                          ),

                          const SizedBox(height: 20),
                          _buildTextField('Nama Pengguna', controller: _nameController),
                          _buildTextField('Email', controller: _emailController),
                          _buildTextField('No. HP', controller: _telponController),
                          _buildTextField('Kata Sandi', controller: _passwordController, obscure: true),
                          _buildTextField('Konfirmasi Kata Sandi', controller: _confirmPasswordController, obscure: true),

                          const SizedBox(height: 10),

                          // Privacy agreement
                          Row(
                            children: [
                              Checkbox(
                                value: _isAgreed,
                                onChanged: (value) => setState(() => _isAgreed = value!),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      const TextSpan(text: 'Dengan mendaftar, Anda menyetujui '),
                                      TextSpan(
                                        text: 'Kebijakan Privasi',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context, '/privacy');
                                          },
                                      ),
                                      const TextSpan(text: ' Kami'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Sign up button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: _isAgreed
                                  ? () {
                                      final pass = _passwordController.text;
                                      final confirm = _confirmPasswordController.text;

                                      if (pass.length < 6) {
                                        _showError('Kata Sandi kurang dari 6 karakter');
                                      } else if (pass != confirm) {
                                        _showError('Password yang kamu masukkan belum cocok. Coba dicek lagi, ya!');
                                      } else {
                                        context.read<RegisterBloc>().add(
                                          RegisterEvent.registerUser(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            telpon: _telponController.text,
                                            password: _passwordController.text,
                                            passwordConfirmation: _confirmPasswordController.text,
                                          ),
                                        );
                                      }
                                    }
                                  : null,
                              child: const Text('Sign up', style: TextStyle(color: Colors.white)),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Sudah punya akun? ',
                                children: [
                                  TextSpan(
                                    text: 'Log in',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Custom text field builder
  Widget _buildTextField(String label, {TextEditingController? controller, bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: 'Masukkan $label',
              suffixIcon: obscure ? const Icon(Icons.visibility_off_outlined) : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}
