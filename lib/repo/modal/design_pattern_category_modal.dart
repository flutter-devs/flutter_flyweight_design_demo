import 'package:flutter_flyweight_design_demo/repo/modal/design_model.dart';

class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<DesignPattern> patterns;

  DesignPatternCategory({
    this.id,
    this.title,
    this.color,
    this.patterns,
  });

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    var designPatternJsonList = json['patterns'] as List;
    var designPatternList = designPatternJsonList
        .map((designPatternJson) => DesignPattern.fromJson(designPatternJson))
        .toList();

    return DesignPatternCategory(
      id: json['id'],
      title: json['title'],
      color: int.parse(json['color']),
      patterns: designPatternList,
    );
  }
}
