import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

class Setting {
  final IconData icon;
  final String text;
  final Widget? action;

  Setting(this.icon, this.text, this.action);
}

List<Setting> getSettings(BuildContext context) {
  return [
    Setting(Icons.dark_mode_rounded, S.of(context).dark_mode,
        switchTheme(context)),
    Setting(Icons.language_rounded, S.of(context).change_language,
        _SelectLanguageWidget()
    ),
    Setting(Icons.person_rounded, S.of(context).profile_info,
        Icon(Icons.chevron_right)),
    Setting(
        Icons.delete_outline_rounded,
        S.of(context).delete_profile,
        SizedBox(
          height: 1,
          width: 1,
        )),
  ];
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Setting> settings = getSettings(context);

    return ListView.separated(
      itemCount: settings.length,
      itemBuilder: (BuildContext context, int index) {
        return _SettingsItemWidget(setting: settings[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 10, thickness: 0.8, color: Theme.of(context).dividerColor);
      },
    );
  }
}

class _SettingsItemWidget extends StatelessWidget {
  final Setting setting;
  const _SettingsItemWidget({Key? key, required this.setting}) : super(key: key);

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




Widget switchTheme(BuildContext context) {
  return IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints.tightFor(height: 24, width: 24),
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
            ? Icon(Icons.radio_button_off)
            : Icon(Icons.radio_button_on),
  );
}

class _SelectLanguageWidget extends StatefulWidget {
  const _SelectLanguageWidget({Key? key}) : super(key: key);

  @override
  State<_SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<_SelectLanguageWidget> {
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

class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');

  void setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
}
