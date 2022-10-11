import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:elevate_ecommerce/shared/widgets/common_widgets.dart';
import 'package:elevate_ecommerce/shared/widgets/no_account_text.dart';
import 'package:elevate_ecommerce/shared/widgets/socal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                const Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignForm(),
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
                    GetBuilder<AuthController>(builder: (_) {
                      return SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {
                          controller.signUpWithFacebook();
                        },
                      );
                    }),
                    SocalCard(
                      icon: "assets/icons/apple.svg",
                      press: () {
                        CommonWidgets.snackBar("Todo :", "Apple Sign In");
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
