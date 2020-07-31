import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_data.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_type.dart';
import 'package:meta/meta.dart';


class ShapeFlyweightData {
  final ShapeData shapeData;
  final Map<ShapeType, PositionedShape> shapesMap = Map<ShapeType, PositionedShape>();

  ShapeFlyweightData({
    @required this.shapeData,
  }) : assert(shapeData != null);

  PositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeData.createShape(shapeType);
    }

    return shapesMap[shapeType];
  }

  int getShapeInstancesCount() {
    return shapesMap.length;
  }
}
