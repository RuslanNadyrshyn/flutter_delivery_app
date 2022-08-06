import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';

BoxDecoration cardBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).cardTheme.color,
      border: Border.all(color: Colors.black.withOpacity(0.2)),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
  );
}


String getIngredientsString(List<String> ingredients) {
  return ingredients.reduce((value, element) => '$value, $element');
}

List<String> getDefaultSupTypes(BuildContext context) {
  return [S.of(context).all, S.of(context).open];
}
List<String> getDefaultProdTypes(BuildContext context) {
  return [S.of(context).all];
}