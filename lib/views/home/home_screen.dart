import 'package:badges/badges.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:elevate_ecommerce/data/fake_data_shop.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:elevate_ecommerce/views/home/components/categories.dart';
import 'package:elevate_ecommerce/views/home/components/discount_banner.dart';
import 'package:elevate_ecommerce/views/home/components/home_carousel.dart';
import 'package:elevate_ecommerce/views/home/components/home_section.dart';
import 'package:elevate_ecommerce/views/home/components/pin_top_section.dart';
import 'package:elevate_ecommerce/views/home/components/product_card.dart';
import 'package:elevate_ecommerce/views/product_page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SafeArea(
        child: CustomScrollView(
          primary: false,
          controller: ScrollController(),
          slivers: [
            customScrollAppbar(context),
            const PinTopSection(),
            SliverList(
                delegate: SliverChildListDelegate([
              HomeSection(
                title: 'Categories'.toUpperCase(),
                isBigTitle: false,
                onTap: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: FakeDataShop.categories.map((card) {
                    return CategoryCard(
                        cardIcon: card.icon,
                        cardText: card.title,
                        onTap: () {});
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const HomeSection(
                title: "For You",
                isHaveShowMoreButton: false,
              ),
              _buildForYou(context),
              SizedBox(
                height: getProportionateScreenWidth(24),
              ),
              const HomeSection(
                title: "Trending",
                isHaveShowMoreButton: false,
              ),
              _buildForYou(context),
              SizedBox(
                height: getProportionateScreenWidth(24),
              ),
              const HomeSection(
                title: "Promotions",
                isHaveShowMoreButton: false,
              ),
              const DiscountBanner(),
              SizedBox(
                height: getProportionateScreenWidth(24),
              ),
              const HomeSection(
                title: "Promotions",
                isHaveShowMoreButton: false,
              ),
              CategoryCard(
                  cardIcon: "assets/images/Fashion.png",
                  cardText: "cardText",
                  onTap: () {})
            ]))
          ],
        ),
      ),
    );
  }

  Widget _buildForYou(context) {
    return Obx(() => SizedBox(
          height: 250,
          child: ListView.builder(
            primary: false,
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.productData.length,
            itemBuilder: (context, index) {
              return ProductCard(
                  imagePath: controller.productData[index].image,
                  productName: controller.productData[index].title,
                  price: controller.productData[index].price,
                  isFullCard: false,
                  onTap: () {
                    Get.to(() => ProductScreen(productModel: controller.productData[index],));
                    
                    //     .addProductToCart(controller.productData[index]);
                    //Get.toNamed('/product/${controller.productData[index].id}');
                  });
            },
          ),
        ));
  }

  SliverAppBar customScrollAppbar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      floating: true,
      pinned: true,
      elevation: 0,
      expandedHeight: getProportionateScreenWidth(188),
      stretch: true,
      //onStretchTrigger:(){},
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/Vector.svg"),
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
                  icon: SvgPicture.asset("assets/icons/Cart.svg")),
            ))
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/E.svg"),
        ],
      ),
      flexibleSpace: const FlexibleSpaceBar(
        background: SizedBox(width: double.infinity, child: HomeCarousel()),
      ),
    );
  }
}
