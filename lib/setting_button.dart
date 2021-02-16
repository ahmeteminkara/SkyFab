import 'package:flutter/material.dart';

class SkyFabSettingButton {
  IconData iconData;
  String title;
  bool isActive;
  Function(bool) onTap;

  SkyFabSettingButton({
    @required this.iconData,
    @required this.title,
    @required this.onTap,
    this.isActive = false,
  });
}
