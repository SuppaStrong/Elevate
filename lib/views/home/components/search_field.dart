import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function? onTap;
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GetBuilder<HomeController>(
        builder: (_) {
          return TextField(
            onTap: onTap as void Function()?,
            controller: controller.searchTextController,
            onChanged: (value) {
              controller.addSearchToList(value);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "What are you looking for?",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.searchTextController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.clearSearch();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: kPrimaryColor,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
