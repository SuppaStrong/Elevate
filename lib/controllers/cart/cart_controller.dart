import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;



  void addProductToCart(ProductModel productModel, int number) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += number;
      // ignore: avoid_print
      print(productsMap);
    } else {
      productsMap[productModel] = number;
      // ignore: avoid_print
      print(productsMap);
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Empty your Cart ?",
      titleStyle: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure about that',
      middleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey.shade300,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: kPrimaryColor,
      textConfirm: " Yes ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed("/cart");
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: kPrimaryColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
