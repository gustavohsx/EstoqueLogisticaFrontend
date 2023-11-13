// import 'dart:js_interop';

// import 'package:estoque_logistica/models/product_model.dart';
// import 'package:estoque_logistica/repositoty/i_product_repository.dart';
// import 'package:pocketbase/pocketbase.dart';

// class ProductHttpRepository implements IProductRepository {
//   final pb = PocketBase('http://127.0.0.1:8090');

//   @override
//   Future<List<ProductModel>> findAllProducts() async {
//     await pb.admins.authWithPassword(
//       'gustavohsx07@gmail.com',
//       'gustavo@13',
//     );
//     final rec = await pb.buildUrl('/api/collections/produto/records');
//     final records = await pb.collection('produto').getList();
//     records.items.forEach((element) {
//       print(element.id);
//     });

//     final Map<String, dynamic> responseMap = records.toJson();
//   }
// }
