import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_info.dart';

class Body extends StatelessWidget {
  final authController = Get.find<AuthController>();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileData(),
                const Divider(),
                const SizedBox(height: 20),
                ProfileMenu(
                    title: "My Account",
                    icon: Icons.person_rounded,
                    trailing: "",
                    color: Colors.purple,
                    onTap: () => Get.toNamed("/signin")),
                const SizedBox(height: 16),
                ProfileMenu(
                    title: "Language",
                    icon: Icons.language,
                    trailing: "English",
                    color: Colors.orange.shade800,
                    onTap: () {}),
                const SizedBox(height: 16),
                ProfileMenu(
                    title: "Notifications",
                    icon: Icons.notifications_outlined,
                    trailing: "",
                    color: Colors.blue,
                    onTap: () {}),
                const SizedBox(height: 16),
                ProfileMenu(
                    title: "Settings",
                    icon: Icons.settings,
                    trailing: "",
                    color: Colors.green,
                    onTap: () {}),
                const SizedBox(height: 16),
                ProfileMenu(
                    title: "Help Center",
                    icon: Icons.help_outline_rounded,
                    trailing: "",
                    color: Colors.deepPurple,
                    onTap: () {}),
                const SizedBox(height: 16),
                ProfileMenu(
                    title: "Log Out",
                    icon: Icons.logout_outlined,
                    trailing: "",
                    color: Colors.red,
                    onTap: () => authController.signOutFromApp(),
                    ),
                const SizedBox(height: 16),
              ],
            ),
            const SizedBox(
              height: 64,
            ),
            Text("Version 1.0.0",
                style: body16.copyWith(color: Colors.orange.shade700)),
          ],
        ),
      ),
    );
  }
}
