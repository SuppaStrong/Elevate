import 'package:flutter/material.dart';
import '../../../size_config.dart';

class DiscountBannerCard extends StatelessWidget {
  final Function onTap;

  const DiscountBannerCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getProportionateScreenWidth(12)),
      width: getProportionateScreenWidth(284),
      height: getProportionateScreenWidth(160),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/discountBanner1.png",),
            scale: 0.7,
            ),

        color: Color.fromRGBO(0, 54, 70, 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: onTap as void Function(),
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(16)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          DiscountBannerCard(
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DiscountBannerCard(
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DiscountBannerCard(
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
