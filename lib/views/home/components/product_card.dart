import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;
  final bool isFullCard;
  final GestureTapCallback onTap;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.isFullCard,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(12)),
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          width: getProportionateScreenWidth(130),
          height: getProportionateScreenWidth(isFullCard ? 241 : 176),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getProportionateScreenWidth(130),
                height: getProportionateScreenWidth(isFullCard ? 195 : 130),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromRGBO(254, 254, 254, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(27, 50, 95, 0.08),
                      offset: Offset(0, 8),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: isFullCard
                    ? FittedBox( 
                        fit: BoxFit.fill,
                        child: Image.network(imagePath),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.network(imagePath))),
              ),
              Text(
                productName,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 1)),
              ),
              Text("\$$price",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(130, 130, 130, 1))),
            ],
          ),
        ),
      ),
    );
  }
}
