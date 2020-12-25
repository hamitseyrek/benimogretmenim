import 'package:benimogretmenim/ui/widgets/no_account_text.dart';
import 'package:benimogretmenim/ui/widgets/social_card.dart';

import '../../sign_up/components/sign_up_form.dart';
import 'package:benimogretmenim/ui/helper/size_config.dart';
import 'package:benimogretmenim/ui/styles/heading_style.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          // To scroll when widgets doesn't fit
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "Kayıt Formu",
                style: headingStyle(),
              ),
              Text(
                "Lütfen kayıt olmak için aşağıdaki \nformu doldurunuz.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: SizeConfig.screenHeight *
                      0.07), // Toplam yüksekliğin %8 i
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
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
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                "Kayıt olarak 'Üyelik Sözleşmesi'ni kabul \netmiş olursun",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
