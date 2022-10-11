import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CategoryCard extends StatelessWidget {
  final String cardIcon, cardText;
  final GestureTapCallback onTap;

  const CategoryCard({super.key, required this.cardIcon, required this.cardText, required this.onTap});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(12)),
      child: InkWell(
        //hoverColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: getProportionateScreenWidth(88),
          width: getProportionateScreenWidth(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: getProportionateScreenWidth(56),
                width: getProportionateScreenWidth(56),
                padding: EdgeInsets.all(getProportionateScreenWidth(16)),
                decoration: const BoxDecoration(
                  
                  borderRadius: BorderRadius.all(Radius.circular(56)),
                  
                  color: Colors.white
                ),
                child: Image.asset(cardIcon),
              ),
              Text(cardText, style: const TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(79, 79, 79, 1)))
            ],
          ),
        ),
      ),
    );
  }
}
