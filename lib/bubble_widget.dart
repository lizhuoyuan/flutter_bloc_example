import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleWidget extends CustomPainter {
  final Color color;
  final double width;
  final double height;
  final double radius;

  final double bottomTriangleWeight;
  final double bottomTriangleHeight;

  //起始点
  final double bottomTriangleMarginStart;

  //顶点
  final double bottomPointMarginStart;

  BubbleWidget(
    this.color,
    this.width,
    this.height,
    this.radius,
    this.bottomTriangleMarginStart,
    this.bottomTriangleWeight,
    this.bottomTriangleHeight,
    this.bottomPointMarginStart,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    //矩形
    Rect rect = Rect.fromLTRB(0, 0, width, height);
    //圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, paint);

    Path path = Path()..moveTo(bottomTriangleMarginStart, height);
    path.lineTo(bottomTriangleMarginStart + bottomTriangleWeight, height);
    path.lineTo(bottomPointMarginStart, height + bottomTriangleHeight);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
