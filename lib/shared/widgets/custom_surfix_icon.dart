import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(16),
        height: getProportionateScreenWidth(16),
        child: SvgPicture.asset(
          svgIcon,
          height: getProportionateScreenWidth(12),
        ),
      ),
    );
  }
}
