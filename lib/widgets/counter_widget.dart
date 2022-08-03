
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  final double fontSize;

  const CounterWidget({Key? key, required this.counter, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).backgroundColor,
        border: Border.all(color: Theme.of(context).backgroundColor),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(8),
      // color: Theme.of(context).backgroundColor,
      child: Text(
        '$counter',
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}