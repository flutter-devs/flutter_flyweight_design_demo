import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';

class SquareShape implements PositionedShape {
  final Color color;
  final double width;

  SquareShape({
    @required this.color,
    @required this.width,
  })  : assert(color != null),
        assert(width != null);

  double get height => width;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
