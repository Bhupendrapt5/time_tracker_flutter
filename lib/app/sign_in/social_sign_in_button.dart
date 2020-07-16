import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String logoPath,
    @required String text,
    @required Color color,
    @required Color textColor,
    @required VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(logoPath),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Opacity(
                opacity: 0,
                child: Image.asset(logoPath),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
