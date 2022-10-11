import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileData extends StatelessWidget {
  ProfileData({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  height: 104,
                  width: 104,
                  decoration: BoxDecoration(
                  
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: authController.displayUserPhoto.value == "" ? const NetworkImage("https://media.istockphoto.com/vectors/letter-e-design-vector-in-blue-green-gradient-vector-id1168197279?k=20&m=1168197279&s=612x612&w=0&h=4Btb50rdyd1WZNkjmBwErhtIWSDKBtciQmVPQEUw0R8=") : NetworkImage(
                        authController.displayUserPhoto.value,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authController.displayUserName.value,
                      style: body16,
                    ),
                    Text(
                      authController.displayAddress.value,
                      style: body16,
                    ),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
