import 'package:elevate_ecommerce/bindings/initial_biding.dart';
import 'package:elevate_ecommerce/controllers/theme/theme_controller.dart';
import 'package:elevate_ecommerce/routes/routes.dart';
import 'package:elevate_ecommerce/shared/helper/keyboard.dart';
import 'package:elevate_ecommerce/themes/themes_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtil.hideKeyboard(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Elevate Ecommerce",
        //locale: Locale(GetStorage().read<String>('lang').toString()),
        home: const SplashScreen(),
        initialBinding: InitialBinding(),
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: getThemeMode(themeController.theme),
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>("auth") == true
            ? Routes.home
            : Routes.splash,
        getPages: Routes.routes,
      ),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: theme(),
//       // home: SplashScreen(),
//       
//       initialRoute: SplashScreen.routeName,
//       routes: routes,
//     );
//   }
// }





  // List<dynamic> menuItems = [
  //   {
  //     'icon': 'assets/icons/home.svg',
  //     'label': 'Home',
  //   },
  //   {
  //     'icon': 'assets/icons/box.svg',
  //     'label': 'Delivery',
  //   },
  //   {
  //     'icon': 'assets/icons/chat.svg',
  //     'label': 'Messages',
  //   },
  //   {
  //     'icon': 'assets/icons/wallet.svg',
  //     'label': 'Wallet',
  //   },
  //   {
  //     'icon': 'assets/icons/profile.svg',
  //     'label': 'Profile',
  //   },
  // ];
  // int _currentIndex = 0;

  // @override
  // Widget build(BuildContext context) {
  //   final appBottomNavigationBarCustom = BottomNavigationBar(
  //     backgroundColor: Colors.white,
  //     showUnselectedLabels: true,
  //     unselectedItemColor: Colors.black87,
  //     elevation: 32.0,
  //     type: BottomNavigationBarType.fixed,
  //     selectedLabelStyle: const TextStyle(
  //       height: 1.5,
  //       fontSize: 12,
  //     ),
  //     unselectedLabelStyle: const TextStyle(
  //       height: 1.5,
  //       fontSize: 12,
  //     ),
  //     items: menuItems.map((i) {
  //       return BottomNavigationBarItem(
  //         icon: SvgPicture.asset(i['icon']),
  //         activeIcon: SvgPicture.asset(
  //           i['icon'],
  //           color: kPrimaryColor,
  //         ),
  //         label: i['label'],
  //       );
  //     }).toList(),
  //     currentIndex: _currentIndex,
  //     onTap: _onBottomTap,
  //     selectedItemColor: kPrimaryColor,
  //   );
  //   return Scaffold(
  //     body: pages[_currentIndex],
  //     bottomNavigationBar: appBottomNavigationBarCustom,
  //   );
  // }

  // onather 

  //  body: PageView(
  //       controller: _homeController.pageController,
  //       //physics: const NeverScrollableScrollPhysics(),
  //       children: [
  //         ..._homeController.pages
  //       ],
  //     ),