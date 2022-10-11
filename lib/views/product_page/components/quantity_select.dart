import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/product/product_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/shared/widgets/rounded_icon_btn.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantitySelect extends StatelessWidget {
  QuantitySelect({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  final controller = Get.find<ProductController>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Row(
        children: [
          RoundedIconBtn(
            icon: Icons.remove,
            showShadow: false,
            press: () {
              controller.decrement();
            },
          ),
          SizedBox(width: getProportionateScreenWidth(12)),
          Obx(() => Text(
                "${controller.count.value}",
                style: body16Bold,
              )),
          SizedBox(width: getProportionateScreenWidth(12)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: false,
            press: () {
              controller.increment();
            },
          ),
        ],
      ),
    );
  }
}
