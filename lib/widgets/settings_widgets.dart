import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../views/settings_view.dart';

class Setting {
  final IconData icon;
  final String text;
  final Widget? action;

  Setting(this.icon, this.text, this.action);
}

List<Setting> getSettings(BuildContext context) {
  return [
    Setting(
        Icons.dark_mode_rounded, S.of(context).dark_mode, switchTheme(context)),
    Setting(Icons.language_rounded, S.of(context).change_language,
        SelectLanguageWidget()),
    Setting(Icons.person_rounded, S.of(context).profile_info,
        Icon(Icons.chevron_right)),
    Setting(Icons.delete_outline_rounded, S.of(context).delete_profile,
        SizedBox(height: 1, width: 1)),
  ];
}

Widget switchTheme(BuildContext context) {
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
