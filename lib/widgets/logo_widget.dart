import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final Color color;

  const LogoWidget({
    super.key,
    this.size = 44,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _LogoPainter(color: color),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  final Color color;

  _LogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 48.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.scale(scale, scale);

    // Letter R stem & upper loop
    final rPath = Path();
    rPath.moveTo(6, 8);
    rPath.lineTo(24, 8);
    rPath.arcToPoint(
      const Offset(24, 24),
      radius: const Radius.circular(8),
      clockwise: true,
    );
    rPath.lineTo(6, 24);
    rPath.close();
    canvas.drawPath(rPath, paint);

    // R inner cutout
    final cutoutPaint = Paint()
      ..color = const Color(0xFFD7D8D6)
      ..style = PaintingStyle.fill;
    final cutoutPath = Path();
    cutoutPath.moveTo(14, 14);
    cutoutPath.lineTo(22, 14);
    cutoutPath.arcToPoint(
      const Offset(22, 18),
      radius: const Radius.circular(2),
      clockwise: true,
    );
    cutoutPath.lineTo(14, 18);
    cutoutPath.close();
    canvas.drawPath(cutoutPath, cutoutPaint);

    // R leg
    final legPath = Path();
    legPath.moveTo(17, 22);
    legPath.lineTo(28, 40);
    legPath.lineTo(20, 40);
    legPath.lineTo(11, 25.5);
    legPath.lineTo(11, 40);
    legPath.lineTo(6, 40);
    legPath.lineTo(6, 22);
    legPath.close();
    canvas.drawPath(legPath, paint);

    // K arms
    final kPath = Path();
    kPath.moveTo(27, 20);
    kPath.lineTo(37, 8);
    kPath.lineTo(44, 8);
    kPath.lineTo(33, 21.5);
    kPath.lineTo(44, 40);
    kPath.lineTo(37, 40);
    kPath.lineTo(28, 25.5);
    kPath.lineTo(30, 22.5);
    kPath.close();
    canvas.drawPath(kPath, paint);

    // Architectural top accent
    final accentPath = Path();
    accentPath.moveTo(40, 7);
    accentPath.lineTo(43, 3);
    accentPath.lineTo(37, 3);
    accentPath.lineTo(34, 7);
    accentPath.close();
    canvas.drawPath(accentPath, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LogoPainter oldDelegate) =>
      oldDelegate.color != color;
}
