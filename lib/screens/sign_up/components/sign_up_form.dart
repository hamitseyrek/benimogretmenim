import 'package:benimogretmenim/ui/helper/error_messages_helper.dart';
import 'package:benimogretmenim/ui/helper/size_config.dart';
import 'package:benimogretmenim/ui/widgets/custom_sufix_icon.dart';
import 'package:benimogretmenim/ui/widgets/default_button.dart';
import 'package:benimogretmenim/ui/widgets/form_error.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Devam et",
            press: () {
              if (_formKey.currentState.validate()) {
                // sıradaki forma gideceğiz
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != confirm_password) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre Doğrulama",
        hintText: "Şifrenizi tekrar giriniz",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre",
        hintText: "Şifrenizi giriniz",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kEmailNullError);
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Mail adresinizi giriniz",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
