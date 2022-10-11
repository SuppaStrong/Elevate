import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:elevate_ecommerce/shared/widgets/socal_card.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:get/get.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Register Account", style: headingStyle),
                const SizedBox(height: 8),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<AuthController>(builder: (_) {
                      return SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          controller.signUpWithGoogle();
                        },
                      );
                    }),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/apple.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Center(
                  child: RichText(
                    text : TextSpan(
                          text: "By continuing your confirm that you agree \n          with our ",
                          style: body14,
                          
                          
                          children: const [
                            TextSpan(text: 'Term and Condition',style: TextStyle(color: kPrimaryColor, decoration: TextDecoration.underline,fontWeight: FontWeight.w500),)
                          ]
                    ),
                    
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

