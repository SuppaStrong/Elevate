import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  final String? text;
  final Function? press;

  const DefaultButton({super.key, this.text, this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.black,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
