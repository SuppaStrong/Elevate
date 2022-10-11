import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductPageAppBar extends StatelessWidget {
  ProductPageAppBar({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      expandedHeight: MediaQuery.of(context).size.height * 0.6,
      elevation: 0,
      snap: true,
      floating: true,
      stretch: true,
      //onStretchTrigger:(){},
      backgroundColor: Colors.white,
      leading: TextButton(
        child: SvgPicture.asset(
          "assets/icons/back_icon.svg",
          height: 15,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Get.back();
        },
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
      flexibleSpace: FlexibleSpaceBar(
        stretchModes:  const <StretchMode>[
          StretchMode.zoomBackground,
        ],
        background: Padding(
          padding: const EdgeInsets.all(24),
          child: CachedNetworkImage(
            imageUrl: productModel.image,
            fit: BoxFit.contain,
          ),
        ),
        // background: Image.network(product.image, fit: BoxFit.cover,)
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Transform.translate(
            offset: const Offset(0, 1),
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Container(
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
            ),
          )),
    );
  }
}
