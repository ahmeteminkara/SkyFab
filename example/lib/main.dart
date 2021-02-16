import 'package:flutter/material.dart';

import 'package:skyfab/skyfab.dart';
import 'package:skyfab/setting_button.dart';
import 'package:skyfab/skyfab_properties.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyFab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SkyFabSettingButton> buttons = List();

  @override
  void initState() {
    super.initState();

    buttons.add(SkyFabSettingButton(
      iconData: Icons.phone_forwarded_rounded,
      title: "Call",
      onTap: (bool status) {},
    ));

    buttons.add(SkyFabSettingButton(
      iconData: Icons.vibration_rounded,
      title: "Vibration",
      onTap: (bool status) {},
    ));

    buttons.add(SkyFabSettingButton(
      iconData: Icons.highlight_rounded,
      title: "Flashlight",
      onTap: (bool status) {},
    ));

    buttons.add(SkyFabSettingButton(
      iconData: Icons.notifications_active_rounded,
      title: "Alarm",
      onTap: (bool status) {},
    ));

    buttons.add(SkyFabSettingButton(
      iconData: Icons.campaign_rounded,
      title: "Notification",
      onTap: (bool status) {},
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SkyFab(
      buttonList: buttons,
      skyFabProperties: SkyFabProperties(),
      child: body,
    );
  }

  Widget get body => Scaffold(
        appBar: AppBar(
          title: Text("SkyFab"),
        ),
        body: Center(
          child: Text("Hello..."),
        ),
      );
}
