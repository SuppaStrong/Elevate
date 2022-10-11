import 'package:badges/badges.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:elevate_ecommerce/data/fake_data_shop.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:elevate_ecommerce/views/home/components/categories.dart';
import 'package:elevate_ecommerce/views/home/components/product_card.dart';
import 'package:elevate_ecommerce/views/home/components/search_field.dart';
import 'package:elevate_ecommerce/views/product_page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 251, 255, 0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ),
        actions: [
          Obx(() => Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.fade,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () => Get.toNamed("/cart"),
                    icon: SvgPicture.asset(
                      "assets/icons/Cart.svg",
                      color: const Color.fromRGBO(51, 51, 51, 1),
                    )),
              ))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/E.svg",
              color: const Color.fromRGBO(51, 51, 51, 1),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SearchField(
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: FakeDataShop.categories.map((card) {
                  return CategoryCard(
                      cardIcon: card.icon, cardText: card.title, onTap: () {});
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Obx(() => Expanded(
                  child: controller.searchList.isEmpty &&
                          controller.searchTextController.text.isNotEmpty
                      ? Image.asset("assets/images/no_result.png")
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 4,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.searchList.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                imagePath: controller.searchList[index].image,
                                productName: controller.searchList[index].title,
                                price: controller.searchList[index].price,
                                isFullCard: false,
                                onTap: () {
                                  Get.to(() => ProductScreen(
                                        productModel:
                                            controller.searchList[index],
                                      ));
                                });
                          },
                        ),
                ))
          ],
        ),
      ),
    );
  }
}
