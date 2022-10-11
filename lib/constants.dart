import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 73, 91, 255);
const kPrimaryLightColor = Color.fromRGBO(249, 251, 255, 1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color.fromARGB(255, 60, 57, 57);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 43, 43, 89),
  height: 1.5,
);
final heading1 = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 43, 43, 89),
  height: 1.5,
);

final heading2 = TextStyle(
  fontSize: getProportionateScreenWidth(22),
  fontWeight: FontWeight.w500,
  color: const Color.fromARGB(255, 43, 43, 89),
  height: 1.3,
  letterSpacing: -0.1,
);
final body14 = TextStyle(
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w400,
  color: kTextColor,
  height: 1.3,
  letterSpacing: 0.2,
);
final body14Bold = TextStyle(
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w500,
  color: kTextColor,
  height: 1.3,
  letterSpacing: 0.2,
);
final catatgoryHeaderSectionStyle = TextStyle(
  color: const Color.fromRGBO(79, 79, 79, 1),
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w700,
);
final productHeaderSectionStyle =  TextStyle(
  color: const Color.fromRGBO(51, 51, 51, 1),
  fontSize: getProportionateScreenWidth(24),
  fontWeight: FontWeight.w700,
);

final body16 = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  fontWeight: FontWeight.w400,
  color: kTextColor,
  height: 1.3,
  letterSpacing: 0.2,
);

final body16Bold = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  fontWeight: FontWeight.w600,
  color: kTextColor,
  height: 1.3,
  letterSpacing: 0.2,
);

final body22Bold = TextStyle(
  fontSize: getProportionateScreenWidth(22),
  fontWeight: FontWeight.w600,
  color: const Color.fromARGB(255, 43, 43, 89),
  height: 1.4,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter a valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}
