import 'package:estoque_logistica/models/product_model.dart';
import 'package:pocketbase/pocketbase.dart';

class ProductRepository {
  Future<ProductModel> findOneProduct(String codigo) async {
    final pb = PocketBase('https://spessoa.fly.dev');
    await pb.collection('users').authWithPassword(
          'default',
          'Sorriso.123',
        );
    try {
      RecordModel record = await pb
          .collection('produto')
          .getFirstListItem('codprod="$codigo" || codauxiliar="$codigo"');
      dynamic descricao = record.data['descricao'];
      dynamic codprod = record.data['codprod'];
      dynamic embalagem = record.data['embalagem'];
      dynamic unidade = record.data['unidade'];
      dynamic pesoLiquido = record.data['pesoliq'];
      dynamic pesoBruto = record.data['pesobruto'];
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
      dynamic gtincodauxliar2 = (record.data['gtincodauxliar2'] != null)
          ? record.data['gtincodauxliar2']
          : ' ';
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
        qtdGeral,
        qtdAvaria,
        qtdBloqueada,
        qtdReservada,
        qtdDisponivel,
        dtultent,
      );
    } catch (e) {
      print('Produto não encontrado! $e');
      return ProductModel('', 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, '');
    }
  }
}