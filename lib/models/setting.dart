import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/settings/settings_widgets.dart';

class Setting {
  final IconData icon;
  final String text;
  final Widget? action;

  Setting(this.icon, this.text, this.action);
}

List<Setting> getSettings(BuildContext context) {
  return [
    Setting(
        Icons.dark_mode_rounded, S.of(context).dark_mode, switchThemeIconButton(context)),
    Setting(Icons.language_rounded, S.of(context).change_language,
        SelectLanguageWidget()),
    Setting(Icons.person_rounded, S.of(context).profile_info,
        Icon(Icons.chevron_right)),
    // Setting(Icons.delete_outline_rounded, S.of(context).delete_profile,
    //     SizedBox(height: 1, width: 1)),
  ];
}
