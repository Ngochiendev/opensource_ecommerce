import 'package:ecommerce_ec/src/pages/auth/pages/login_page.dart';
import 'package:ecommerce_ec/src/pages/auth/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  bool signIn = true;
  @override
  void initState() {
    super.initState();
  }

  switchScreen() {
    setState(() {
      signIn = !signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return signIn
        ? LoginPage(
            toggleView: switchScreen,
          )
        : SignupPage(
            toggleView: switchScreen,
          );
  }
}
