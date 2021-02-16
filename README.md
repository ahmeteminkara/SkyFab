# SkyFab

This Flutter plugin creates a fab and quick access panel floating in the interface

## Getting Started
```yaml
dependencies:
    skyfab:
        git:
            url: git://github.com/ahmeteminkara/SkyFab.git
```
```dart
import 'package:skyfab/skyfab.dart';
import 'package:skyfab/setting_button.dart';
import 'package:skyfab/skyfab_properties.dart';
```


## Models
```java
class SkyFabProperties {
  double panelHeight;
  double fabSize;
  Color fabColor;
  Color fabCloseColor;
  IconData fabIconData;
  IconData fabCloseIconData;
  Color activeButtonColor;
  Color passiveButtonColor;
  int panelColumn;
}

class SkyFabSettingButton {
  IconData iconData;
  String title;
  bool isActive;
  Function(bool) onTap; 
  // The parameter of the onTap method returns its selected state
}
```

## Variables
```java
List<SkyFabSettingButton> buttons = List();

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
```


## Usage
```java
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
```

## Media

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/SkyFab/main/example/ss/gif.gif" width="250" /></kbd>