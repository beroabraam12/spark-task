import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/pages/cart.dart';
import 'package:spark_task/pages/home.dart';
import 'package:spark_task/pages/login.dart';
import 'package:spark_task/pages/register.dart';

import 'providers/user.dart';
import 'providers/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          LoginPage.routeName: (BuildContext ctx) => LoginPage(),
          RegisterPage.routeName: (BuildContext ctx) => RegisterPage(),
          HomePage.routeName: (BuildContext ctx) => HomePage(),
          CartPage.routeName: (BuildContext ctx) => CartPage(),
        },
      ),
    );
  }
}
