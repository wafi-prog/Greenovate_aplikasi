import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _iconDownController;
  late AnimationController _iconSideController;
  late AnimationController _logoFadeController;

  late Animation<Offset> _iconSlideDown;
  late Animation<Offset> _iconSlideLeft;
  late Animation<double> _logoFade;

  bool showSideMove = false;
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    _iconDownController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _iconSideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _logoFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _iconSlideDown = Tween<Offset>(
      begin: const Offset(0.0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _iconDownController, curve: Curves.easeOut));

    _iconSlideLeft = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0),
    ).animate(CurvedAnimation(parent: _iconSideController, curve: Curves.easeInOut));

    _logoFade = CurvedAnimation(parent: _logoFadeController, curve: Curves.easeIn);

    _iconDownController.forward().then((_) {
      setState(() => showSideMove = true);
      _iconSideController.forward().then((_) {
        setState(() => showLogo = true);
        _logoFadeController.forward();
      });
    });

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/boarding1');
    });
  }

  @override
  void dispose() {
    _iconDownController.dispose();
    _iconSideController.dispose();
    _logoFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FDF6),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: showSideMove ? _iconSlideLeft : _iconSlideDown,
              child: Image.asset(
                'assets/images/mascot.png',
                width: 85,
                height: 85,
              ),
            ),
            // Jarak super kecil aja biar rapet
            const SizedBox(width: 4),
            if (showLogo)
              FadeTransition(
                opacity: _logoFade,
                child: Image.asset(
                  'assets/images/logogreenovate.png',
                  width: 175,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
