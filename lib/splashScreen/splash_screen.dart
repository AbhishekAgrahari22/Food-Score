// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';
import 'package:food_score/auth/ui/registration_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();

    // Logo bounce / scale
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // Background animation
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    // Navigate after delay
    Timer(const Duration(seconds: 4), () {
      Get.off(() => const RegistrationPage());
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  Widget buildMultiLayerBackground(Size size) {
    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        return Stack(
          children: [
            // Layer 1: soft pulsing circles
            CustomPaint(
              size: size,
              painter: LayerCirclesPainter(_bgController.value, 0.3, 100),
            ),
            // Layer 2: smaller floating particles
            CustomPaint(
              size: size,
              painter: LayerCirclesPainter(_bgController.value, 0.1, 40),
            ),
            // Layer 3: subtle moving waves / lines
            CustomPaint(
              size: size,
              painter: LayerWavePainter(_bgController.value),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildMultiLayerBackground(size),

          // Animated logo
          AnimatedBuilder(
            animation: _logoController,
            builder: (context, child) {
              double scale = 0.9 + 0.2 * _logoController.value;
              double rotation = 0.05 * (_logoController.value - 0.5);

              return Transform.rotate(
                angle: rotation,
                child: Transform.scale(
                  scale: scale,
                  child: Image.asset("assets/icons/app_icon.png", width: 160),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Layer circles painter
class LayerCirclesPainter extends CustomPainter {
  final double animationValue;
  final double opacity;
  final double maxRadius;
  LayerCirclesPainter(this.animationValue, this.opacity, this.maxRadius);

  final Random random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 5; i++) {
      double radius =
          maxRadius * (0.5 + 0.5 * sin(animationValue * 2 * pi + i));
      double x = size.width * 0.2 * i + 30 * sin(animationValue * 2 * pi + i);
      double y = size.height * 0.3 * i + 20 * cos(animationValue * 2 * pi + i);

      paint.color = Colors.redAccent.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant LayerCirclesPainter oldDelegate) => true;
}

// Layer waves painter
class LayerWavePainter extends CustomPainter {
  final double animationValue;
  LayerWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Color.fromRGBO(255, 82, 82, 0.1);

    Path path = Path();
    for (double x = 0; x <= size.width; x++) {
      double y =
          20 * sin((x / size.width * 2 * pi) + (animationValue * 2 * pi)) +
          size.height * 0.5;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LayerWavePainter oldDelegate) => true;
}
