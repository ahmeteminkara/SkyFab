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
import 'package:skyfab/skyfab_controller.dart';
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
final List<SkyFabSettingButton> buttons = List();
final SkyFabController controller = SkyFabController();

// controller.showPanel();
// controller.hidePanel();


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
        buttonList: buttons, // @required
        child: body,        // @required
        controller: controller, 
    );
}

Widget get body => Scaffold(
    appBar: AppBar(
        title: Text("SkyFab"),
    ),
    body: Center(
        child: Column(
            children: [
                FlatButton(
                onPressed: () => controller.showPanel(),
                child: Text("Show Panel"),
                ),
                FlatButton(
                onPressed: () => controller.hidePanel(),
                child: Text("Hide Panel"),
                ),
            ],
        ),
    ),
);
```

## Media

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/SkyFab/main/example/ss/gif.gif" width="350" /></kbd>