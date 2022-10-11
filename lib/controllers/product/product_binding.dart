import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/product/product_controller.dart';
import 'package:elevate_ecommerce/provider/product_provider.dart';
import 'package:elevate_ecommerce/repositories/product_repositories.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));
    Get.lazyPut(() => CartController());
    Get.lazyPut<ProductController>(() => ProductController(Get.find()),fenix: true);
  }
}
