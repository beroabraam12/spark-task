import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/providers/user.dart';

import '../component/LoginPage/email.dart';
import '../component/LoginPage/password.dart';
import '../component/LoginPage/confirm_pass.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  static final routeName = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController _passwordTextController = TextEditingController();

  Future submitLogin(context) async {
    final signup = Provider.of<User>(context, listen: false).signup;
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState.save();
    //
    var success = await signup();
    if (success) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: (mediaQuery.size.height - mediaQuery.padding.top) *
                            0.1),
                    child: Container(
                      height:
                          (mediaQuery.size.height - mediaQuery.padding.top) *
                              0.08,
                      child: FittedBox(
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (mediaQuery.size.height - mediaQuery.padding.top) *
                        0.12,
                  ),
                  Container(
                    height: (mediaQuery.size.height - mediaQuery.padding.top) *
                        0.3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: EmailText(mediaQuery),
                            flex: 3,
                          ),
                          Expanded(
                            child: PasswordText(
                                mediaQuery, _passwordTextController),
                            flex: 3,
                          ),
                          Expanded(
                            child: ConfirmPasswordText(
                                mediaQuery, _passwordTextController),
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical:
                            (mediaQuery.size.height - mediaQuery.padding.top) *
                                0.1,
                        horizontal: mediaQuery.size.width * 0.2),
                    width: mediaQuery.size.width * 0.6,
                    height: (mediaQuery.size.height - mediaQuery.padding.top) *
                        0.07,
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : RaisedButton(
                            onPressed: () => submitLogin(context),
                            child: Text(
                              "Register",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            textColor: Theme.of(context).textTheme.button.color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                  ),
                  FlatButton(
                      child: Text("Login?"),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(LoginPage.routeName)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
