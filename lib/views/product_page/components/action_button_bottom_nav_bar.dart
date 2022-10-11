import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/product/product_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:elevate_ecommerce/shared/widgets/outline_button.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({Key? key, required this.productModel}) : super(key: key);
  final cardController = Get.find<CartController>();
  final productController = Get.find<ProductController>();
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(24),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.25),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Expanded(
                child: OutlineButton(
                      text: "Add To Cart",
                      press: () {
                        cardController.addProductToCart(
                            productModel, productController.count.value);
                      },
                    ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DefaultButton(
                    text: "Buy now",
                    press: () {
                      Get.toNamed("/cart");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
