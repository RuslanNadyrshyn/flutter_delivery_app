import 'package:flutter/material.dart';

// main_widget


// Login_view
InputDecoration inputDecoration(context) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white54,
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    enabledBorder: myInputBorder(context),
    focusedBorder: myFocusBorder(context),
    border: myInputBorder(context),
  );
}

OutlineInputBorder myInputBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 1,
      ));
}
OutlineInputBorder myFocusBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 3,
      ));
}

BoxDecoration cardBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).cardTheme.color,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ]);
}
BoxDecoration listBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ]);
}