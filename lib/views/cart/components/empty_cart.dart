import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/shopping-cart.png"),
            
            Text("Your Card is Empty", style: heading1,),
            const SizedBox(height: 8,),
            Text("Look like you haven't added \n any thing to your cart yet", style: body16,),
            const SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: DefaultButton(
                text: "Start Shopping",
                press: (){
                  Get.toNamed("/home");
                },
                
            
              ),
            )

          ],
        ),
      ),
    );
  }
}
