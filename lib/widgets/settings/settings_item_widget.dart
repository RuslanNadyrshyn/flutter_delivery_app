import 'package:flutter/material.dart';

import '../../models/setting.dart';

class SettingsItemWidget extends StatelessWidget {
  final Setting setting;
  const SettingsItemWidget({Key? key, required this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(setting.icon),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              setting.text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          setting.action!,
        ],
      ),
    );
  }
}


