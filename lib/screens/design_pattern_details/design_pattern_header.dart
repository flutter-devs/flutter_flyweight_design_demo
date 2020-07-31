import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_model.dart';

class DesignPatternHeader extends StatelessWidget {
  final DesignPattern designPattern;

  const DesignPatternHeader({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              designPattern.title,
              style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold)
            ),
          ],
        ),
        const SizedBox(height: spaceL),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                designPattern.description,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 99,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
