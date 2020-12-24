import 'package:benimogretmenim/screens/forgot_password/forgot_password_screen.dart';
import 'package:benimogretmenim/screens/login_success/login_success_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:benimogretmenim/screens/splash/splash_screen.dart';
import 'package:benimogretmenim/screens/sign_in/sign_in_screen.dart';

//for route names
// all route is defined in here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
};
