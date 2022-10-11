import 'package:elevate_ecommerce/controllers/auth/auth_binding.dart';
import 'package:elevate_ecommerce/controllers/home/home_binding.dart';
import 'package:elevate_ecommerce/controllers/product/product_binding.dart';
import 'package:elevate_ecommerce/main_home.dart';
import 'package:elevate_ecommerce/views/cart/cart_screen.dart';
import 'package:elevate_ecommerce/views/complete_profile/complete_profile_screen.dart';
import 'package:elevate_ecommerce/views/forgot_password/forgot_password_screen.dart';
import 'package:elevate_ecommerce/views/login_success/login_success_screen.dart';
import 'package:elevate_ecommerce/views/sign_in/sign_in_screen.dart';
import 'package:elevate_ecommerce/views/sign_up/sign_up_screen.dart';
import 'package:elevate_ecommerce/views/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const splash = '/splash';
  static const home = '/home';
  

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/signin',
      page: () => const SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/completeProfile',
      page: () => const CompleteProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/loginSucess',
      page: () => const LoginSuccessScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => MainHome(),
      bindings: [
        HomeBinding(),
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    // GetPage(
    //   name: '/search',
    //   page: () => SearchScreen(),
    //   binding: AuthBinding(),
    // ),
    GetPage(
      name: '/cart',
      page: () => CartScreen(),
      bindings: [
        ProductBinding(),
        AuthBinding(),
      ],
    ),
    // GetPage(
    //   name: '/product/:id',
    //   page: () => ProductScreen(),
    //   bindings: [
    //     ProductBinding(),
    //     AuthBinding(),
    //   ],
    // )
  ];
}
