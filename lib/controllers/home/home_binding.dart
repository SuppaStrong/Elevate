import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:elevate_ecommerce/provider/product_provider.dart';
import 'package:elevate_ecommerce/repositories/product_repositories.dart';
import 'package:get/get.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));

    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    
  }
}
