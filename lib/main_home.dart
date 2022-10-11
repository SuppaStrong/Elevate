import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'constants.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();
  final List<dynamic> menuItems = [
    {
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/box.svg',
      'label': 'Delivery',
    },
    {
      'icon': 'assets/icons/chat.svg',
      'label': 'Messages',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      'label': 'Wallet',
    },
    {
      'icon': 'assets/icons/profile.svg',
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: _homeController.currentPage.value,
            children: _homeController.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 32.0,
            showUnselectedLabels: true,
            currentIndex: _homeController.currentPage.value,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              height: 1.5,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              height: 1.5,
              fontSize: 12,
            ),
            items: menuItems.map((i) {
              return BottomNavigationBarItem(
                icon: SvgPicture.asset(i['icon']),
                activeIcon: SvgPicture.asset(
                  i['icon'],
                  color: kPrimaryColor,
                ),
                label: i['label'],
              );
            }).toList(),
            onTap: (index) {
              _homeController.currentPage.value = index;
            },
          ),
        ));
  }
}
