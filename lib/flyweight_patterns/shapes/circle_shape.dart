import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';

class CircleShape implements PositionedShape {
  final Color color;
  final double diameter;

  CircleShape({
    @required this.color,
    @required this.diameter,
  })  : assert(color != null),
        assert(diameter != null);

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
