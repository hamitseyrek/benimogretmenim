import 'package:benimogretmenim/screens/sign/components/body.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  static String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oturum Aç"),
      ),
      body: Body(),
    );
  }
}
