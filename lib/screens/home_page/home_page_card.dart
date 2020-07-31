import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_pattern_category_modal.dart';
import 'package:flutter_flyweight_design_demo/utils/card_select.dart';

class HomePageCard extends StatelessWidget {
  final DesignPatternCategory category;

  const HomePageCard({
    @required this.category,
  }) : assert(category != null);

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      category.title,
      style: Theme.of(context).textTheme.headline6.copyWith(
            fontSize: 26.0,
            color: Colors.white,
          ),
      overflow: TextOverflow.ellipsis,
    );
    var contentText = Text(
      category.patterns.length == 1
          ? '${category.patterns.length} pattern'
          : '${category.patterns.length} patterns',
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.white,
          ),
    );
    var onSelectionCardTap = () => Navigator.pushNamed(
          context,
          categoryRoute,
          arguments: category,
        );

    return CardSelect(
      backgroundColor: Color(category.color),
      backgroundHeroTag: "${category.id}",
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
