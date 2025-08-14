import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nike_ecom/Widgets/Nav_bar.dart';
import 'package:nike_ecom/views/onboarding_screen.dart';
import 'login_or_SignUP.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  BottomNavWrapper()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF150c2e),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  size: const Size(120, 120),
                  painter: NikeArcPainter(progress: _controller.value),
                );
              },
            ),
            Image.asset(
              'lib/images/nike_Logo.png', // Make sure this path is correct
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class NikeArcPainter extends CustomPainter {
  final double progress;
  NikeArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 6.0;
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = -pi / 2;
    final sweepAngle = pi * 2.6 * progress;

    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: [
        Colors.white,
        Colors.white.withOpacity(0.7),
        Colors.white.withOpacity(0.3),
        Colors.white.withOpacity(0.0),
      ],
      stops: const [0.0, 0.6, 0.85, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant NikeArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
