import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/product/product_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/shared/widgets/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  CartCard({
    Key? key,
    required this.productModel,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  final ProductModel productModel;
  final int index;
  final int quantity;
  final cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Image.network(productModel.image),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${productModel.title.substring(0, 15)}...",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Obx(() => Text(
                    "\$${cartController.productSubTotal[index].toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  )),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                showShadow: false,
                press: () {
                  cartController.removeProductsFromCart(productModel);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(12)),
              Text(
                    "$quantity",
                    style: body16Bold,
                  ),
              SizedBox(width: getProportionateScreenWidth(12)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: false,
                press: () {
                  cartController.addProductToCart(productModel,1);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
