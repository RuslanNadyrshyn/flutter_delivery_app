import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';

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
  // List<String> loc = locales.map((Locale e) => e.toString()).toList();

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
          Intl.defaultLocale = newValue;
        });
        print(Intl.getCurrentLocale());
        print(S.of(context).app_bar_title);
      },
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
        ),
      ),
      // body: ChangeThemeViewWidget(),
      body: _SettingsListWidget(settings: [
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
      ]),
    );
  }
}

class Setting {
  final IconData icon;
  final String text;
  final Widget? action;

  Setting(this.icon, this.text, this.action);
}

class _SettingsListWidget extends StatelessWidget {
  final List<Setting> settings;

  const _SettingsListWidget({Key? key, required this.settings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ListView.separated(
        itemCount: settings.length,
        itemBuilder: (BuildContext context, int index) {
          return _SettingsRowWidget(setting: settings[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 15, thickness: 0.8, color: Theme.of(context).dividerColor);
        },
      ),
    );
  }
}

class _SettingsRowWidget extends StatelessWidget {
  final Setting setting;
  const _SettingsRowWidget({Key? key, required this.setting}) : super(key: key);

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
