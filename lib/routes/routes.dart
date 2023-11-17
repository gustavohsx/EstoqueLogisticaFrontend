import 'package:estoque_logistica/pages/configuration.dart';
import 'package:estoque_logistica/pages/home.dart';
import 'package:estoque_logistica/pages/product_information.dart';

var routes = {
  '/home': (context) => const Home(),
  '/product': (context) => const ProductInformation(),
  '/config': (context) => const Configuration(),
};
