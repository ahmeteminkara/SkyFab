library skyfab;

import 'dart:async';

import 'package:flutter/material.dart';

import 'setting_button.dart';
import 'skyfab_controller.dart';
import 'skyfab_properties.dart';

class SkyFab extends StatefulWidget {
  final List<SkyFabSettingButton> buttonList;
  final SkyFabProperties skyFabProperties;
  final SkyFabController controller;
  final Widget child;

  SkyFab({
    @required this.child,
    @required this.buttonList,
    this.controller,
  }) : this.skyFabProperties = SkyFabProperties();

  @override
  _SkyFabState createState() => _SkyFabState();
}

class _SkyFabState extends State<SkyFab> {
  Offset startOffset;
  Offset updateOffset;
  Offset historyOffset;

  bool isTouchOut = true;
  bool isPositionLeft = true;
  bool isShowingPanel = false;

  double x = 0;
  double y = 250;

  double xDiff = 0;
  double yDiff = 0;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      print("widget.controller is null");
    } else {
      widget.controller.isShowingPanel = this.isShowingPanel;
      widget.controller.showPanel = this.showPanel;
      widget.controller.hidePanel = this.hidePanel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: widget.child),
          AnimatedPositioned(
            left: 0,
            right: 0,
            bottom: isShowingPanel ? 0 : -widget.skyFabProperties.panelHeight,
            height: widget.skyFabProperties.panelHeight,
            child: _panel,
            duration: Duration(milliseconds: 500),
            curve: isShowingPanel ? Curves.ease : Curves.easeOutBack,
          ),
          AnimatedPositioned(
              duration: Duration(milliseconds: isTouchOut ? 500 : 0),
              curve: isShowingPanel ? Curves.ease : Curves.easeOutBack,
              left: x,
              top: y,
              child: GestureDetector(
                child: SizedBox(
                  height: widget.skyFabProperties.fabSize,
                  width: widget.skyFabProperties.fabSize,
                  child: _fab,
                ),
                onHorizontalDragStart: (details) {
                  if (isShowingPanel) return;
                  startOffset = details.globalPosition;
                },
                onHorizontalDragUpdate: (details) {
                  if (isShowingPanel) return;

                  updateOffset = details.globalPosition;
                  xDiff = updateOffset.dx - startOffset.dx - 30;
                  yDiff = updateOffset.dy - startOffset.dy - 30;

                  setState(() {
                    isTouchOut = false;
                    x = xDiff + startOffset.dx;
                    y = yDiff + startOffset.dy;
                  });
                },
                onHorizontalDragEnd: (details) {
                  if (isShowingPanel) return;
                  Timer(Duration.zero, () {
                    Size size = MediaQuery.of(context).size;
                    EdgeInsets padding = MediaQuery.of(context).padding;
                    double topPadding = padding.top + widget.skyFabProperties.fabSize;

                    y += yDiff * 0.5;
                    setState(() {
                      isTouchOut = true;

                      if (y < topPadding) {
                        y = topPadding;
                      } else if (y > (size.height - topPadding)) {
                        y = size.height - topPadding;
                      }

                      if (isPositionLeft) {
                        if (x > 90) {
                          isPositionLeft = false;
                          x = size.width - widget.skyFabProperties.fabSize;
                        } else {
                          isPositionLeft = true;
                          x = 0;
                        }
                      } else {
                        if (x + widget.skyFabProperties.fabSize < size.width - 90) {
                          isPositionLeft = true;
                          x = 0;
                        } else {
                          isPositionLeft = false;
                          x = size.width - widget.skyFabProperties.fabSize;
                        }
                      }
                    });
                  });
                },
              )),
        ],
      ),
    );
  }

  Widget get _panel => Card(
        margin: EdgeInsets.all(20),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: GridView.count(
          padding: EdgeInsets.all(5),
          crossAxisCount: widget.skyFabProperties.panelColumn,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: widget.buttonList.map((e) {
            return _panelButton(e);
          }).toList(),
        ),
      );

  Widget get _fab {
    if (isShowingPanel) {
      return FloatingActionButton(
        elevation: 6,
        backgroundColor: widget.skyFabProperties.fabCloseColor,
        onPressed: () {
          hidePanel();
        },
        child: Icon(widget.skyFabProperties.fabCloseIconData),
      );
    } else {
      return FloatingActionButton(
        elevation: isTouchOut ? 6 : 0,
        backgroundColor: isTouchOut ? widget.skyFabProperties.fabColor : widget.skyFabProperties.fabColor.withAlpha(150),
        onPressed: () {
          showPanel();
        },
        child: Icon(widget.skyFabProperties.fabIconData),
      );
    }
  }

  showPanel() {
    Size size = MediaQuery.of(context).size;

    historyOffset = Offset(x, y);
    setState(() {
      x = (size.width * 0.5) - (widget.skyFabProperties.fabSize * 0.5);
      y = size.height - widget.skyFabProperties.panelHeight - widget.skyFabProperties.fabSize + 30;
      isShowingPanel = true;
    });
  }

  hidePanel() {
    setState(() {
      x = historyOffset.dx;
      y = historyOffset.dy;
      isShowingPanel = false;
    });
  }

  Widget _panelButton(SkyFabSettingButton button) {
    return GridTile(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        color: button.isActive ? widget.skyFabProperties.activeButtonColor : widget.skyFabProperties.passiveButtonColor,
        child: InkWell(
          onTap: () {
            setState(() {
              button.isActive = !button.isActive;
              button.onTap(button.isActive);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                button.iconData,
                size: 35,
                color: button.isActive ? Colors.white : Colors.grey[800],
              ),
              SizedBox(height: 5),
              Text(button.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: button.isActive ? Colors.white : Colors.grey[800],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
