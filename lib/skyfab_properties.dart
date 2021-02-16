import 'package:flutter/material.dart';

class SkyFabProperties {
  final double panelHeight;
  final double fabSize;
  final Color fabColor;
  final Color fabCloseColor;
  final IconData fabIconData;
  final IconData fabCloseIconData;
  final Color activeButtonColor;
  final Color passiveButtonColor;
  final int panelColumn;

  const SkyFabProperties({
    this.fabSize = 60,
    this.fabColor = Colors.blue,
    this.panelHeight = 300,
    this.fabIconData = Icons.settings,
    this.fabCloseColor = Colors.red,
    this.fabCloseIconData = Icons.close,
    this.activeButtonColor = Colors.blue,
    this.passiveButtonColor = const Color.fromRGBO(240, 240, 240, 1),
    this.panelColumn = 3,
  }) : assert(panelColumn >= 2 && panelColumn <= 4);
}
