import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/providers/user.dart';

class EmailText extends StatefulWidget {
  final mediaQuery;
  EmailText(this.mediaQuery);
  @override
  _EmailTextState createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {
  @override
  Widget build(BuildContext context) {
    final loginUser = Provider.of<User>(context);
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: widget.mediaQuery.size.width * 0.1),
      width: widget.mediaQuery.size.width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'E-mail',
        ),
        validator: (value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onSaved: (value) => loginUser.email = value,
      ),
    );
  }
}
