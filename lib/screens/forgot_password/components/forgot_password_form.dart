import 'package:benimogretmenim/ui/helper/error_messages_helper.dart';
import 'package:benimogretmenim/ui/helper/size_config.dart';
import 'package:benimogretmenim/ui/widgets/custom_sufix_icon.dart';
import 'package:benimogretmenim/ui/widgets/default_button.dart';
import 'package:benimogretmenim/ui/widgets/form_error.dart';
import 'package:benimogretmenim/ui/widgets/no_account_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Mail adresinizi giriniz",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Şifremi Sıfırla",
            press: () {
              if (_formKey.currentState.validate()) {
                // buton ile yapılacak işlemler
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
