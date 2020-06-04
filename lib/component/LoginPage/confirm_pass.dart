import 'package:flutter/material.dart';

class ConfirmPasswordText extends StatefulWidget {
  final mediaQuery, _passwordTextController;
  ConfirmPasswordText(this.mediaQuery, this._passwordTextController);
  @override
  _ConfirmPasswordTextState createState() => _ConfirmPasswordTextState();
}

class _ConfirmPasswordTextState extends State<ConfirmPasswordText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: widget.mediaQuery.size.width * 0.1),
      width: widget.mediaQuery.size.width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Confirm Password",
        ),
        validator: (value) {
          if (widget._passwordTextController.text != value) {
            return "Password Not Match";
          }
          return null;
        },
        obscureText: true,
      ),
    );
  }
}