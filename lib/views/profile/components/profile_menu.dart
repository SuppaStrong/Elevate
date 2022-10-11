import 'package:elevate_ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final String trailing;
  final Color color;
  final Function onTap;

  const ProfileMenu({super.key, required this.title, required this.icon, required this.trailing, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: Text(title, style: body16),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trailing,
                  style: body14),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        onTap: onTap as void Function() );
  }
}
