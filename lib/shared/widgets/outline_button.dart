import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';



  class OutlineButton extends StatefulWidget {
    const OutlineButton({
      Key? key,
      this.text,
      this.press,
    }) : super(key: key);
    final String? text;
    final Function? press;

    @override
    State<OutlineButton> createState() => _OutlineButtonState();
  }

  class _OutlineButtonState extends State<OutlineButton> {
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              primary: kPrimaryColor,
              backgroundColor: Colors.white,
              side: const BorderSide(color: kPrimaryColor, width: 1)),
          onPressed: widget.press as void Function()?,
          child: Text(
            widget.text!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kPrimaryColor,
            ),
          ),
        ),
      );
    }
  }
