import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/providers/user.dart';

class PasswordText extends StatefulWidget {
  final mediaQuery,_passwordTextController;
  PasswordText(this.mediaQuery,this._passwordTextController);
  @override
  _PasswordTextState createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  @override
  Widget build(BuildContext context) {
    final loginUser = Provider.of<User>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.mediaQuery.size.width * 0.1),
      width: widget.mediaQuery.size.width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
        validator: (value) {
          if (value.length < 6) {
            return "Password must be 6 letters or numbers";
          }
          return null;
        },
        controller: widget._passwordTextController,
        obscureText: true,
         onSaved: (String value) => loginUser.password = value,
      ),
    );
  }
}