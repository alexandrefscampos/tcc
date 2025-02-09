import 'package:flutter/material.dart';

class Frog extends StatelessWidget {
  final double size;
  final Color color;

  const Frog({
    super.key,
    this.size = 50,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.8, size * 0.8),
          painter: FrogFacePainter(),
        ),
      ),
    );
  }
}

class LilyPad extends StatelessWidget {
  final double size;
  final Color color;

  const LilyPad({
    super.key,
    this.size = 60,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
    );
  }
}

class FrogFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw eyes
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      size.width * 0.1,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.3),
      size.width * 0.1,
      paint,
    );

    // Draw pupils
    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      size.width * 0.05,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.3),
      size.width * 0.05,
      paint,
    );

    // Draw smile
    final smilePath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.8,
        size.width * 0.7,
        size.height * 0.6,
      );

    canvas.drawPath(
      smilePath,
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
