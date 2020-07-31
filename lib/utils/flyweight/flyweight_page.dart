import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/positioned_shape.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_data.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_flyweight_data.dart';
import 'package:flutter_flyweight_design_demo/flyweight_patterns/shape_type.dart';
import 'package:flutter_flyweight_design_demo/utils/flyweight/positioned_shape_page.dart';


class FlyweightPage extends StatefulWidget {
  @override
  _FlyweightPageState createState() => _FlyweightPageState();
}

class _FlyweightPageState extends State<FlyweightPage> {
  static const int SHAPES_COUNT = 200;

  final ShapeData shapeData = ShapeData();

  ShapeFlyweightData _shapeFlyweightData;
  List<PositionedShape> _shapesList;

  int _shapeInstancesCount = 0;
  bool _useFlyweightFactory = false;

  @override
  void initState() {
    super.initState();

    _shapeFlyweightData = ShapeFlyweightData(
      shapeData: shapeData,
    );

    _buildShapesList();
  }

  void _buildShapesList() {
    var shapeInstancesCount = 0;
    _shapesList = List<PositionedShape>();

    for (var i = 0; i < SHAPES_COUNT; i++) {
      var shapeType = _getRandomShapeType();
      var shape = _useFlyweightFactory
          ? _shapeFlyweightData.getShape(shapeType)
          : shapeData.createShape(shapeType);

      shapeInstancesCount++;
      _shapesList.add(shape);
    }

    setState(() {
      _shapeInstancesCount = _useFlyweightFactory
          ? _shapeFlyweightData.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  ShapeType _getRandomShapeType() {
    var values = ShapeType.values;

    return values[Random().nextInt(values.length)];
  }

  void _toggleUseFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });

    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (var shape in _shapesList)
          PositionedShapePage(
            shape: shape,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile.adaptive(
              title: Text(
                'Flyweight Data',
                style: TextStyle(color: Colors.black,fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.black,
              value: _useFlyweightFactory,
              onChanged: _toggleUseFlyweightFactory,
            ),
          ],
        ),
        Center(
          child: Text(
            'Shape count: $_shapeInstancesCount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
