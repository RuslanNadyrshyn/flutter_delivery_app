import 'package:flutter/material.dart';

import '../constants.dart';

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({Key? key}) : super(key: key);

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
}

class _MainViewWidgetState extends State<MainViewWidget> {
  int _selectedTab = 0;

  void _changeSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<WidgetOptions> widgetOptions = getWidgetOptions(context);
    return Scaffold(
      appBar: widgetOptions[_selectedTab].appBar,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        child: widgetOptions[_selectedTab].widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeSelectedTab,
        type: BottomNavigationBarType.fixed,
        items: getBottomNavigationItems(context),
      ),
    );
  }
}
