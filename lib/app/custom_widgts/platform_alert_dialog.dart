import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker/app/custom_widgts/plateform_widget.dart';

class PlatFormAlertDialogBox extends PlatformWidet {
  final String title;
  final String content;
  final String defaultActionText;

  PlatFormAlertDialogBox({
    @required this.title,
    @required this.content,
    @required this.defaultActionText,
  })  : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildWidget(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildWidget(context),
    );
  }

  List<Widget> _buildWidget(BuildContext context) {
    return [
      PlatformAlertDialogAction(
        callback: () => Navigator.pop(context),
        widget: Text(defaultActionText),
      ),
    ];
  }
}

class PlatformAlertDialogAction extends PlatformWidet {
  final Widget widget;
  final VoidCallback callback;

  PlatformAlertDialogAction({
    @required this.widget,
    @required this.callback,
  });
  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: widget,
      onPressed: callback,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      onPressed: callback,
      child: widget,
    );
  }
}
