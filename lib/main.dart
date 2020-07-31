import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/router.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData.dark(),

      onGenerateRoute: Router.generateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

