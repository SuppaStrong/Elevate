
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/product/product_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return Column(
          children: [
            Text(
              productModel.description,
              maxLines: controller.maxLine ? 16 : 2,
              style: TextStyle(
                height: 1.5,
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                controller.seeMore();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.maxLine ? "See less" : "...See more",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    controller.maxLine
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}