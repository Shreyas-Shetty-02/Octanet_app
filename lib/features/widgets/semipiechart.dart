import 'package:flutter/material.dart';
import 'dart:math';

class SemicirclePieChart extends StatefulWidget {
  final List<double>? data; // Make data nullable
  final List<Color>? colors; // Make colors nullable

  const SemicirclePieChart({
    super.key,
    this.data, // Adjust the constructor to accept nullable values
    this.colors,
  });

  @override
  State<SemicirclePieChart> createState() => _SemicirclePieChartState();
}

class _SemicirclePieChartState extends State<SemicirclePieChart> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data ?? [0.0];
    final colors = widget.colors ?? [Color(0xFF999999)];

    return CustomPaint(
      size: Size(300, 150),
      painter: SemicirclePieChartPainter(data, colors),
    );
  }
}

class SemicirclePieChartPainter extends CustomPainter {
  final List<double>? data;
  final List<Color>? colors;

  SemicirclePieChartPainter(this.data, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    if (data == null || colors == null || data!.isEmpty || colors!.isEmpty) {
      return;
    }

    double total = data!.reduce((a, b) => a + b);
    double startAngle = -pi;
    double outerRadius = 150;
    double innerRadius = 122.5;

    for (int i = 0; i < data!.length; i++) {
      double sweepAngle = (data![i] / total) * pi;

      final Path path = Path();

      path.moveTo(outerRadius * cos(startAngle) + size.height,
          outerRadius * sin(startAngle) + size.height);

      path.arcTo(
        Rect.fromCircle(
            center: Offset(outerRadius, size.height), radius: outerRadius),
        startAngle,
        sweepAngle,
        false,
      );

      path.lineTo(innerRadius * cos(startAngle + sweepAngle) + outerRadius,
          innerRadius * sin(startAngle + sweepAngle) + size.height);

      path.arcTo(
        Rect.fromCircle(
            center: Offset(outerRadius, size.height), radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      );

      path.close();

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      paint.color = colors![i];
      canvas.drawPath(path, paint);

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
