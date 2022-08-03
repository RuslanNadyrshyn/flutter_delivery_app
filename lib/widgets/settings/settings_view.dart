import 'package:flutter/material.dart';
import '../../models/setting.dart';
import 'settings_item_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Setting> settings = getSettings(context);

    return ListView.separated(
      padding: EdgeInsets.all(8),
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
