import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:get/get.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Elevate your lifestyle with \n1,000,000+ products.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Buy easily from home\n within a few taps.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Fast delivery \nto your doorstep.",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_signin5.png"),
          fit: BoxFit.cover,
        ),
      ),
      // color: Color.fromARGB(255, 238, 243, 255),
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              "ELEVATE",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
                fontWeight: FontWeight.w800,
                letterSpacing: 4,
              ),
            ),

            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // child: Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: DefaultButton(
                      text: "Continue",
                      press: () {
                        Get.offNamed('/home');
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? kPrimaryColor
            : const Color.fromARGB(255, 145, 174, 252),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
