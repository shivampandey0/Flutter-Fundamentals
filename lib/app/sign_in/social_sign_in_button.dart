import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/common_widgets.dart/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
    String image,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(image),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15),
              ),
              Opacity(opacity: 0, child: Image.asset(image))
            ],
          ),
          onPressed: onPressed,
          color: color,
        );
}
