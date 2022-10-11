import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  final ProductProvider _productProvider;

  ProductController(this._productProvider);

  final TextEditingController quantityController = TextEditingController();
  TextEditingController searchTextController = TextEditingController();

  var count = 1.obs;
  var maxLine = false;
  var productList = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;

  @override
  void onInit() {
    quantityController.text = count.value.toString();

    super.onInit();
  }

  void fetchProduct(int id) {
    change(null, status: RxStatus.loading());

    _productProvider.getProductById(id).then((product) {
      change(product, status: RxStatus.success());
    }).catchError((error) {
      change(null, status: RxStatus.error(error));
    });
  }

  void increment() {
    count.value++;

    quantityController.text = count.value.toString();
  }

  void decrement() {
    if (count.value == 1) return;
    count.value--;

    quantityController.text = count.value.toString();
  }

  


  void seeMore() {
    maxLine = !maxLine;
    update();
  }
}
