class Category {
  final String icon;
  final String title;

  Category({required this.icon, required this.title});
}

class ProductInfo {
  final String image;
  final String productName;
  final String price;

  ProductInfo(
      {required this.image, required this.productName, this.price = "0"});
}

