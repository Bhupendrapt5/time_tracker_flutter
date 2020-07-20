import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/custom_raised_button.dart';

class FormSubmitRaisedButton extends CustomRaisedButton {
  FormSubmitRaisedButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: onPressed,
          color: Colors.indigo,
        );
}
