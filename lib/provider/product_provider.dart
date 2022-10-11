import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/repositories/product_repositories.dart';

class ProductProvider {
  final ProductRepository _productRepository;

  ProductProvider(this._productRepository);
  Future<List<ProductModel>> getProductData() async {
    var product = await _productRepository.getProductData();
    return product.map((product) => ProductModel.fromJson(product)).toList();
  }

  Future<ProductModel> getProductById(int id) async {
    var productId = await _productRepository.getProductById(id);
    return ProductModel.fromJson(productId);
  }
}
