import 'package:elevate_ecommerce/services/networking/capture_interceptor/request_interceptor.dart';
import 'package:elevate_ecommerce/services/networking/capture_interceptor/response_interceptor.dart';
import 'package:get/get_connect.dart';

import 'api_constants.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
