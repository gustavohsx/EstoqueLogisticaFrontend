import 'package:estoque_logistica/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> findAllProducts();
}
