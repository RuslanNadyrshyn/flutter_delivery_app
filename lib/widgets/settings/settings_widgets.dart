import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../models/provider.dart';
import '../../models/setting.dart';

class SettingsItemWidget extends StatelessWidget {
  final Setting setting;
  const SettingsItemWidget({Key? key, required this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(setting.icon),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              setting.text,
              style: TextStyle(fontSize: 18),
            ),
          ),
          setting.action!,
        ],
      ),
    );
  }
}

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({Key? key}) : super(key: key);

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  String dropdownValue = Intl.getCurrentLocale();
  List<Locale> locales = S.delegate.supportedLocales;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: SizedBox(height: 0,),
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      items: locales.map((Locale value) {
        return DropdownMenuItem(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale(newValue));
        });
      },
    );
  }
}

Widget switchThemeIconButton(BuildContext context) {
  return IconButton(
    iconSize: 40,
    padding: EdgeInsets.zero,
    constraints: BoxConstraints.tightFor(height: 50, width: 50),
    onPressed: () {
      if (AdaptiveTheme.of(context).theme ==
          AdaptiveTheme.of(context).lightTheme) {
        AdaptiveTheme.of(context).setDark();
      } else {
        AdaptiveTheme.of(context).setLight();
      }
    },
    icon:
    AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).lightTheme
        ? Icon(Icons.toggle_off_outlined,)
        : Icon(Icons.toggle_on_rounded),
  );
}


