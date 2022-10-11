import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/views/product_page/components/action_button_bottom_nav_bar.dart';
import 'package:elevate_ecommerce/views/product_page/components/prodct_page_star_vote.dart';
import 'package:elevate_ecommerce/views/product_page/components/product_app_bar.dart';
import 'package:elevate_ecommerce/views/product_page/components/product_description.dart';
import 'package:elevate_ecommerce/views/product_page/components/quantity_select.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.productModel,}) : super(key: key);
  final ProductModel productModel;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ActionButtons(productModel: productModel),
      body: CustomScrollView(
        
        slivers: [
          ProductPageAppBar(productModel: productModel),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: kPrimaryLightColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    productModel.title,
                    style: heading2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  StartVote(productModel: productModel),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        '${productModel.price} \$',
                        style: heading2,
                      ),
                      const Spacer(),
                      Text(
                        'Quantity :',
                        style: body14Bold,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      QuantitySelect(productModel: productModel,),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProductDescription(productModel: productModel),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Color",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Size',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
