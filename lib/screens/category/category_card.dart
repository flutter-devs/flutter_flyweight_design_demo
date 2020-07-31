import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_model.dart';
import 'package:flutter_flyweight_design_demo/utils/card_select.dart';

class CategoryCard extends StatelessWidget {
  final DesignPattern designPattern;

  const CategoryCard({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      designPattern.title,
      style: Theme.of(context).textTheme.headline6.copyWith(
            fontSize: 26.0,
          ),
      overflow: TextOverflow.ellipsis,
    );
    var contentText = Text(
      designPattern.description,
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
    var onSelectionCardTap = () => Navigator.pushNamed(
          context,
          designPattern.route,
          arguments: designPattern,
        );

    return CardSelect(
      backgroundColor: Colors.pink[200],
      backgroundHeroTag: "${designPattern.id}",
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
