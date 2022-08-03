import 'package:flutter/material.dart';

BoxDecoration cardBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).cardTheme.color,
      border: Border.all(color: Colors.black.withOpacity(0.2)),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
  );
}


String getIngredientsString(List<String> ingredients) {
  return ingredients.reduce((value, element) => '$value, $element');
}