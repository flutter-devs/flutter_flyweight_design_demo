import 'package:flutter/material.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_pattern_category_modal.dart';
import 'package:flutter_flyweight_design_demo/repo/repositories/design_pattern_categories_repository.dart';
import 'package:flutter_flyweight_design_demo/screens/home_page/home_page_card.dart';

class HomeData extends StatelessWidget {
  final DesignPatternCategoriesRepository repository =
      DesignPatternCategoriesRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          title: Text("Flutter FlyWeight Design Pattern"),
        ),
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FutureBuilder<List<DesignPatternCategory>>(
                    future: repository.get(),
                    initialData: [],
                    builder: (
                      _,
                      AsyncSnapshot<List<DesignPatternCategory>> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            for (var category in snapshot.data)
                              Container(
                                margin: const EdgeInsets.only(top: marginL),
                                child: HomePageCard(
                                  category: category,
                                ),
                              )
                          ],
                        );
                      }

                      return CircularProgressIndicator(
                        backgroundColor: lightBackgroundColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black.withOpacity(0.65),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
