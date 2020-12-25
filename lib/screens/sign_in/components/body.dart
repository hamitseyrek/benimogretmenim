import 'package:benimogretmenim/screens/sign_in/components/sign_form.dart';
import 'package:benimogretmenim/ui/styles/heading_style.dart';
import 'package:benimogretmenim/ui/widgets/no_account_text.dart';
import 'package:benimogretmenim/ui/widgets/social_card.dart';
import '../../../ui/helper/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            // To scroll when widgets doesn't fit
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Hoş Geldiniz",
                  style: headingStyle(),
                ),
                Text(
                  "Litfen mail adresiniz ve şifreniz \nile giriş açınız.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
