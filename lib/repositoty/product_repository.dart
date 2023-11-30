import 'package:estoque_logistica/config/shared_pref.dart';
import 'package:estoque_logistica/models/product_model.dart';
import 'package:pocketbase/pocketbase.dart';

class ProductRepository {
  Future<dynamic> findOneProduct(String codigo) async {
    SharedPref prefs = SharedPref();
    String? host = await prefs.read('server');
    String? user = await prefs.read('user');
    String? password = await prefs.read('password');
    bool isLogin = false;
    final pb = PocketBase(host ?? 'http://192.168.201.216:8090/');
    try {
      await pb.collection('users').authWithPassword(
            user ?? 'default',
            password ?? 'Sorriso.123',
          );
      isLogin = true;
    } catch (e) {
      isLogin = false;
      print('Erro Autenticação');
      print(e);
      try {
        String erroComplete = e.toString();
        String erroSplit =
            erroComplete.substring((erroComplete.lastIndexOf('message:')));
        String erro = erroSplit.substring(9, erroSplit.lastIndexOf('data') - 3);
        return erro;
      } catch (e) {
        String erro = 'Conexão';
        return erro;
      }
    }
    if (isLogin) {
      try {
        RecordModel record = await pb
            .collection('produto')
            .getFirstListItem('codprod="$codigo" || codauxiliar="$codigo"');
        dynamic descricao = record.data['descricao'];
        dynamic codprod = record.data['codprod'];
        dynamic embalagem = record.data['embalagem']
            .toString()
            .replaceAll(r'(', '')
            .replaceAll(r')', '');
        dynamic unidade = record.data['unidade'];
        dynamic pesoLiquido =
            record.data['pesoliq'].toString().replaceAll(r'.', ',');
        dynamic pesoBruto =
            record.data['pesobruto'].toString().replaceAll(r'.', ',');
        dynamic codfab = record.data['codfab'];
        dynamic modulo = record.data['modulo'];
        dynamic rua = record.data['rua'];
        dynamic numero = record.data['numero'];
        dynamic apartamento = record.data['apto'];
        dynamic qtdGeral = record.data['qtestger'];
        dynamic qtdBloqueada = record.data['qtbloqueada'];
        dynamic qtdAvaria = record.data['qtindeniz'];
        dynamic qtdReservada = record.data['qtreservada'];
        dynamic qtdDisponivel = record.data['qtdisponivel'];
        dynamic tipoAlturaPalete = record.data['tipoalturapalete'];
        dynamic alturaPalete = record.data['alturapal'];
        dynamic lastroPalete = record.data['lastropal'];
        dynamic qtTotalPalete = record.data['qttotpal'];
        dynamic alturam3 = record.data['alturam3'];
        dynamic larguram3 = record.data['larguram3'];
        dynamic comprimentom3 = record.data['comprimentom3'];
        dynamic volume = record.data['volume'];
        dynamic gtincodauxiliartrib = record.data['gtincodauxiliartrib'];
        dynamic codauxiliartrib = record.data['codauxiliartrib'];
        dynamic gtincodauxiliar = record.data['gtincodauxiliar'];
        dynamic codauxiliar = record.data['codauxiliar'];
        dynamic gtincodauxliar2 = record.data['gtincodauxiliar2'];
        dynamic codauxiliar2 = record.data['codauxiliar2'];
        dynamic dtultent = record.data['dtultent'];
        return ProductModel(
          record.id,
          codprod,
          descricao,
          embalagem,
          unidade,
          codfab,
          pesoLiquido,
          pesoBruto,
          modulo,
          rua,
          numero,
          apartamento,
          tipoAlturaPalete,
          alturaPalete,
          lastroPalete,
          qtTotalPalete,
          alturam3,
          larguram3,
          comprimentom3,
          volume,
          gtincodauxiliartrib,
          codauxiliartrib,
          gtincodauxiliar,
          codauxiliar,
          gtincodauxliar2,
          codauxiliar2,
          qtdGeral,
          qtdAvaria,
          qtdBloqueada,
          qtdReservada,
          qtdDisponivel,
          dtultent,
        );
      } catch (e) {
        String erroComplete = e.toString();
        String erroSplit =
            erroComplete.substring((erroComplete.lastIndexOf('message:')));
        String erro = erroSplit.substring(9, erroSplit.lastIndexOf('data') - 3);
        return erro;
      }
    }
  }
}
