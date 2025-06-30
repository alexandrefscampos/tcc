import 'package:flutter/material.dart';
import 'package:tcc2/enums/bird_color.dart';
import 'package:tcc2/theme/app_colors.dart';

class Bird extends StatelessWidget {
  final BirdColor color;
  final double size;

  const Bird({
    super.key,
    required this.color,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _getColor(),
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.8, size * 0.8),
          painter: BirdPainter(color: _getColor()),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case BirdColor.green:
        return AppColors.birdBlue;
      case BirdColor.yellow:
        return AppColors.birdDartBlue;
      case BirdColor.red:
        return AppColors.birdLightBlue;
    }
  }
}

class Nest extends StatelessWidget {
  final BirdColor color;
  final double size;

  const Nest({
    super.key,
    required this.color,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.4),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            _getColor().withOpacity(0.1),
            _getColor().withOpacity(0.3),
          ],
        ),
        border: Border.all(
          color: _getColor(),
          width: 2,
        ),
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.6, size * 0.6),
          painter: NestPainter(color: _getColor()),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case BirdColor.green:
        return AppColors.birdBlue;
      case BirdColor.yellow:
        return AppColors.birdDartBlue;
      case BirdColor.red:
        return AppColors.birdLightBlue;
    }
  }
}

class BirdPainter extends CustomPainter {
  final Color color;

  const BirdPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    // Draw bird body (main oval)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.6),
        width: size.width * 0.6,
        height: size.height * 0.5,
      ),
      paint,
    );

    // Draw bird head (smaller oval)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.3),
        width: size.width * 0.4,
        height: size.height * 0.35,
      ),
      paint,
    );

    // Draw eye
    paint.color = AppColors.black;
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.25),
      size.width * 0.05,
      paint,
    );

    // Draw beak
    final beakPath = Path()
      ..moveTo(size.width * 0.8, size.height * 0.3)
      ..lineTo(size.width * 0.9, size.height * 0.35)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..close();

    paint.color = Colors.orange;
    canvas.drawPath(beakPath, paint);

    // Draw wing
    paint.color = color.withOpacity(0.8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.4, size.height * 0.6),
        width: size.width * 0.3,
        height: size.height * 0.4,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NestPainter extends CustomPainter {
  final Color color;

  const NestPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw nest twigs in a circular pattern
    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * (3.14159 / 180);
      final x1 = size.width * 0.5 + (size.width * 0.2) * (angle / 6.28);
      final y1 = size.height * 0.5 + (size.height * 0.2) * (angle / 6.28);
      final x2 = size.width * 0.5 + (size.width * 0.4) * (angle / 6.28);
      final y2 = size.height * 0.5 + (size.height * 0.4) * (angle / 6.28);

      canvas.drawLine(
        Offset(x1, y1),
        Offset(x2, y2),
        paint,
      );
    }

    // Draw nest base
    paint.style = PaintingStyle.fill;
    paint.color = Colors.brown.shade300.withOpacity(0.5);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.6),
        width: size.width * 0.6,
        height: size.height * 0.3,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
