import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';

class StartVote extends StatelessWidget {
  const StartVote({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productModel.rating.rate.toString(),
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange.shade400,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange.shade400,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange.shade400,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange.shade400,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange.shade100,
        ),
      ],
    );
  }
}
