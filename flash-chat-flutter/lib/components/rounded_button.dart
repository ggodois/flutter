import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color btnColor;
  final String btnTitle;
  final Function onPressed;

  RoundedButton({this.btnColor, this.btnTitle, this.onPressed});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: btnColor,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              btnTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
