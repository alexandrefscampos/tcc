import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';

class Frog extends StatelessWidget {
  final FrogColor color;
  final double size;

  const Frog({
    super.key,
    required this.color,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getColor(),
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
          painter: FrogFacePainter(color: _getColor()),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case FrogColor.green:
        return Colors.green;
      case FrogColor.yellow:
        return Colors.yellow;
      case FrogColor.red:
        return Colors.red;
    }
  }
}

class LilyPad extends StatelessWidget {
  final FrogColor color;
  final double size;

  const LilyPad({
    super.key,
    required this.color,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getColor().withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: _getColor(),
          width: 2,
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case FrogColor.green:
        return Colors.green;
      case FrogColor.yellow:
        return Colors.yellow;
      case FrogColor.red:
        return Colors.red;
    }
  }
}

class FrogFacePainter extends CustomPainter {
  final Color color;

  const FrogFacePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
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
