import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/global_provider.dart';
import 'package:food_delivery/themes.dart';
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
    Setting(
        Icons.dark_mode_rounded,
        S.of(context).dark_mode,
        const SwitchThemeIconWidget(),
    ),
    Setting(Icons.language_rounded, S.of(context).change_language,
        const SelectLanguageWidget()),
    Setting(Icons.person_rounded, S.of(context).profile_info,
        const Icon(Icons.chevron_right)),
    // Setting(Icons.delete_outline_rounded, S.of(context).delete_profile,
    //     SizedBox(height: 1, width: 1)),
  ];
  //   [
  //   Setting(
  //       Icons.dark_mode_rounded, S.of(context).dark_mode, switchThemeIconButton(context)),
  //   Setting(Icons.language_rounded, S.of(context).change_language,
  //       SelectLanguageWidget()),
  //   Setting(Icons.person_rounded, S.of(context).profile_info,
  //       Icon(Icons.chevron_right)),
  //   // Setting(Icons.delete_outline_rounded, S.of(context).delete_profile,
  //   //     SizedBox(height: 1, width: 1)),
  // ];
}

class SwitchThemeIconWidget extends StatelessWidget {
  const SwitchThemeIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(height: 50, width: 50),
      onPressed: () {
        Provider.of<GlobalProvider>(context, listen: false).switchTheme();
      },
      icon: Provider.of<GlobalProvider>(context).currentTheme == kLightTheme
          ? const Icon(Icons.toggle_off_outlined)
          : const Icon(Icons.toggle_on_rounded),
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
      underline: const SizedBox(
        height: 0,
      ),
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      items: locales.map((Locale value) {
        return DropdownMenuItem(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          Provider.of<GlobalProvider>(context, listen: false)
              .setLocale(Locale(newValue));
        });
      },
    );
  }
}
