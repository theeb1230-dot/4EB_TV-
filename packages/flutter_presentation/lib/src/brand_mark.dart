import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// Vector-only 4BA identity mark. Geometry is deterministic and asset-free so
/// splash/app surfaces share one source without raster drift.
final class FourBaBrandMark extends StatelessWidget {
  const FourBaBrandMark({super.key, this.size = 96});

  final double size;

  @override
  Widget build(BuildContext context) => Semantics(
    label: '4BA',
    image: true,
    child: SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: const _FourBaBrandPainter()),
    ),
  );
}

final class _FourBaBrandPainter extends CustomPainter {
  const _FourBaBrandPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final gold = Paint()
      ..color = const Color(FourBaColorTokens.gold)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.065
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;
    final strong = Paint()
      ..color = const Color(FourBaColorTokens.goldStrong)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.085
      ..strokeCap = StrokeCap.square;

    final w = size.width;
    final h = size.height;
    final four = Path()
      ..moveTo(w * .16, h * .55)
      ..lineTo(w * .40, h * .18)
      ..lineTo(w * .40, h * .82)
      ..moveTo(w * .14, h * .55)
      ..lineTo(w * .49, h * .55);
    canvas.drawPath(four, strong);

    final b = Path()
      ..moveTo(w * .56, h * .20)
      ..lineTo(w * .56, h * .80)
      ..moveTo(w * .56, h * .22)
      ..quadraticBezierTo(w * .84, h * .18, w * .82, h * .40)
      ..quadraticBezierTo(w * .80, h * .51, w * .58, h * .50)
      ..moveTo(w * .58, h * .50)
      ..quadraticBezierTo(w * .88, h * .48, w * .84, h * .72)
      ..quadraticBezierTo(w * .81, h * .82, w * .56, h * .78);
    canvas.drawPath(b, gold);
  }

  @override
  bool shouldRepaint(covariant _FourBaBrandPainter oldDelegate) => false;
}
