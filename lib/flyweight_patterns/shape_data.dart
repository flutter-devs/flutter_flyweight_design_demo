import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_type.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shapes/circle_shape.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shapes/square_shape.dart';


class ShapeData {
  PositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return CircleShape(
          color: Colors.red.withOpacity(0.2),
          diameter: 10.0,
        );
      case ShapeType.Square:
        return SquareShape(
          color: Colors.blue.withOpacity(0.2),
          width: 10.0,
        );
      default:
        throw new Exception("Shape type '$shapeType' is not supported.");
    }
  }
}
