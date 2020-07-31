import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';

class PositionedShapePage extends StatelessWidget {
  final PositionedShape shape;

  const PositionedShapePage({
    @required this.shape,
  }) : assert(shape != null);

  double _getPosition(double max, double min) {
    var randomPosition = Random().nextDouble() * max;

    return randomPosition > min ? randomPosition - min : randomPosition;
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    return shape.render(
      _getPosition(sizeWidth, 20.0),
      _getPosition(sizeHeight, 300.0),
    );
  }
}
