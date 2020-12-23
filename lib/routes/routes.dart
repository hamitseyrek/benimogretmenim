import 'package:flutter/widgets.dart';
import 'package:benimogretmenim/screens/splash/splash_screen.dart';
import 'package:benimogretmenim/screens/sign/signin_screen.dart';

//for route names
// all route is defined in here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SigninScreen.routeName: (context) => SigninScreen(),
};
