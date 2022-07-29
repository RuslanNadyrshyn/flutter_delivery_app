import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../generated/l10n.dart';
import '../widgets/settings_widgets.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Setting> settings = getSettings(context);

    return ListView.separated(
      itemCount: settings.length,
      itemBuilder: (BuildContext context, int index) {
        return SettingsItemWidget(setting: settings[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 10, thickness: 0.8, color: Theme.of(context).dividerColor);
      },
    );
  }
}



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
