import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Image.asset(
            image!,
            //width: double.infinity,

            height: getProportionateScreenHeight(320),
            width: getProportionateScreenWidth(384),
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: body22Bold,
        ),
      ],
    );
  }
}
