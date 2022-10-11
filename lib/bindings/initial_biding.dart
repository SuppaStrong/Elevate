import 'package:elevate_ecommerce/services/networking/api_service.dart';
import 'package:elevate_ecommerce/services/networking/base_provider.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
  }
}
