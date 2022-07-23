import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class DrawerWrapper extends StatelessWidget {
  const DrawerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
                child: Text(
                  'Delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text(
                S.of(context).home,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text(
                S.of(context).basket,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.pushNamed(context, '/basket');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                S.of(context).settings,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text(
                S.of(context).login,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
