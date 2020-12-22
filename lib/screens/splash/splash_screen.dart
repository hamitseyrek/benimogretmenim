import 'package:flutter/material.dart';
import 'package:benimogretmenim/screens/splash/components/body.dart';
import 'package:benimogretmenim/ui/helper/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
