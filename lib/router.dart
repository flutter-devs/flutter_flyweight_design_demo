import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_model.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_pattern_category_modal.dart';
import 'package:flutter_flyweight_design_demo/screens/category/category_page.dart';
import 'package:flutter_flyweight_design_demo/screens/design_pattern_details/design_pattern_page.dart';
import 'package:flutter_flyweight_design_demo/screens/home_page/home_data.dart';
import 'package:flutter_flyweight_design_demo/splash_screen.dart';
import 'package:flutter_flyweight_design_demo/utils/flyweight/flyweight_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => Splash(),
        );
      case categoryRoute:
        var category = settings.arguments as DesignPatternCategory;
        return MaterialPageRoute(
          builder: (_) => CategoryPage(
            category: category,
          ),
        );
      // Creational

      case _DesignPatternRoutes.flyweightRoute:
        return _buildDesignPatternDetailsPageRoute(
          settings,
          FlyweightPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomeData(),
        );
    }
  }

  static MaterialPageRoute _buildDesignPatternDetailsPageRoute(
    RouteSettings settings,
    Widget example,
  ) {
    var designPattern = settings.arguments as DesignPattern;
    return MaterialPageRoute(
      builder: (_) => DesignPatternDetails(
        designPattern: designPattern,
        example: example,
      ),
    );
  }
}

class _DesignPatternRoutes {

  static const String flyweightRoute = '/flyweight';

}
