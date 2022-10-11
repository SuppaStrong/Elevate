import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final bool isHaveShowMoreButton;
  final bool isBigTitle;
  final Function? onTap;

  const HomeSection(
      {super.key,
      required this.title,
      this.isHaveShowMoreButton = true,
      this.isBigTitle = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        
        left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(16),
        bottom: getProportionateScreenWidth(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBigTitle
                ? productHeaderSectionStyle
                : catatgoryHeaderSectionStyle,
          ),
          isHaveShowMoreButton
              ? MaterialButton(
                  onPressed: onTap as void Function()?,
                  minWidth: 50,
                  splashColor: kPrimaryLightColor,
                  highlightColor: kPrimaryLightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  child: const Icon(
                    IconlyLight.arrow_right_2,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
