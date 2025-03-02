import 'dart:io';

import 'package:estoque_logistica/config/shared_pref.dart';
import 'package:estoque_logistica/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/io_client.dart'; // Para converter JSON

class ProductRepository {
  Future<dynamic> findOneProduct(String codigo) async {
    SharedPref prefs = SharedPref();
    String? host = await prefs.read('server');
    try {
      final url = host != null
          ? '$host/api/produto-app-estoque/consulta/$codigo'
          : 'https://192.168.201.95:8070/api/produto-app-estoque/consulta/$codigo';
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      IOClient ioClient = IOClient(client);

      final response = await ioClient.get(Uri.parse(url));
      print(response.body);
      print(response.headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProductModel(
          1,
          data['codprod'],
          data['descricao'],
          data['embalagem'],
          data['unidade'],
          data['codfab'],
          data['pesoliq'],
          data['pesobruto'],
          data['modulo'],
          data['rua'],
          data['numero'],
          data['apto'],
          data['tipoalturapalete'],
          data['alturapal'],
          data['lastropal'],
          data['qttotpal'],
          data['qtpalete'],
          data['alturam3'],
          data['larguram3'],
          data['comprimentom3'],
          data['volume'],
          data['gtincodauxiliartrib'],
          data['codauxiliartrib'],
          data['gtincodauxiliar'],
          data['codauxiliar'],
          data['gtincodauxiliar2'],
          data['codauxiliar2'],
          data['qtestger'],
          data['qtindeniz'],
          data['qtbloqueada'],
          data['qtreserv'],
          data['qtdisponivel'],
          data['dtultent'],
        );
      } else if (response.statusCode == 204) {
        return 'Produto Não Encotrado';
      } else {
        return 'Erro';
      }
    } catch (e) {
      print(e);
      return 'Erro';
    }
  }
}
