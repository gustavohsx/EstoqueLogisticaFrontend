// import 'package:estoque_logistica/barcode/barcode.dart';
import 'package:estoque_logistica/widgets/information.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('https://spessoa.fly.dev');

class ProductInformation extends StatefulWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  String? barcode = 'Carregando...';
  String? descricao = 'Carregando...';
  int? codprod = 0;
  String? embalagem = 'Carregando...';
  String? unidade = 'Carregando...';
  double? pesoLiquido = 0.0;
  double? pesoBruto = 0.0;
  String? codfab = 'Carregando...';
  String? id = '';
  int? modulo = 0;
  int? rua = 0;
  int? numero = 0;
  int? apartamento = 0;
  int? qtdGeral = 0;
  int? qtdBloqueada = 0;
  int? qtdAvaria = 0;
  int? qtdReservada = 0;
  int? qtdDisponivel = 0;
  String? dtUltEntrada = 'Carregando...';
  int? tipoAlturaPalete = 0;
  int? alturaPalete = 0;
  int? lastroPalete = 0;
  int? qtTotalPalete = 0;
  String? gtincodauxiliartrib = 'Carregando...';
  String? codauxiliartrib = 'Carregando...';
  String? gtincodauxiliar = 'Carregando...';
  String? codauxiliar = 'Carregando...';
  String? gtincodauxliar2 = 'Carregando...';

  @override
  void initState() {
    super.initState();
  }

  void attDataProduct(String? id) async {
    await pb.collection('users').authWithPassword(
          'default',
          'Sorriso.123',
        );

    try {
      final record = await pb.collection('produto').getOne('$id');
      descricao = record.data['descricao'];
      codprod = record.data['codprod'];
      embalagem = record.data['embalagem'];
      unidade = record.data['unidade'];
      pesoLiquido = record.data['pesoliq'];
      pesoBruto = record.data['pesobruto'];
      codfab = record.data['codfab'];
      modulo = record.data['modulo'];
      rua = record.data['rua'];
      numero = record.data['numero'];
      apartamento = record.data['apto'];
      qtdGeral = record.data['qtestger'];
      qtdBloqueada = record.data['qtbloqueada'];
      qtdAvaria = record.data['qtindeniz'];
      qtdReservada = record.data['qtreservada'];
      qtdDisponivel = record.data['qtdisponivel'];
      dtUltEntrada = record.data['dtultent'];
      tipoAlturaPalete = record.data['tipoalturapalete'];
      alturaPalete = record.data['alturapal'];
      lastroPalete = record.data['lastropal'];
      qtTotalPalete = record.data['qttotpal'];
      gtincodauxiliartrib = record.data['gtincodauxiliartrib'];
      codauxiliartrib = record.data['codauxiliartrib'];
      gtincodauxiliar = record.data['gtincodauxiliar'];
      codauxiliar = record.data['codauxiliar'];
      gtincodauxliar2 = (record.data['gtincodauxliar2'] != null)
          ? record.data['gtincodauxliar2']
          : ' ';
      print(record);
      setState(() {});
    } catch (e) {
      print('Produto não encontrado! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final receivedId = ModalRoute.of(context)!.settings.arguments as String?;
    if (receivedId != id) {
      id = receivedId;
      attDataProduct(receivedId);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estoque',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Produto Encontrado:',
                style: BaseTextStyles.mainTitle,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(20),
                // padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$descricao',
                            style: BaseTextStyles.productTitle,
                          ),
                          Text(
                            '$codprod',
                            style: BaseTextStyles.productSubTitle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromARGB(255, 231, 224, 236),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const InformationTitle(
                              title: 'Informações',
                            ),
                            Information(
                              title: 'Embalagem',
                              info: '$embalagem',
                            ),
                            Information(
                              title: 'Unidade',
                              info: '$unidade',
                            ),
                            Information(
                              title: 'Peso Liquido',
                              info: '$pesoLiquido kg',
                            ),
                            Information(
                              title: 'Peso Bruto',
                              info: '$pesoBruto kg',
                            ),
                            Information(
                              title: 'Cod. Fabrica',
                              info: '$codfab',
                            ),
                            const SizedBox(height: 20),
                            const InformationTitle(
                              title: 'Endereço',
                            ),
                            Information(
                              title: 'Modulo',
                              info: '$modulo',
                            ),
                            Information(
                              title: 'Rua',
                              info: '$rua',
                            ),
                            Information(
                              title: 'Número',
                              info: '$numero',
                            ),
                            Information(
                              title: 'Apartamento',
                              info: '$apartamento',
                            ),
                            const SizedBox(height: 20),
                            const InformationTitle(
                              title: 'Estoque',
                            ),
                            Information(
                              title: 'Qtd. Geral',
                              info: '$qtdGeral',
                            ),
                            Information(
                              title: 'Qtd. Bloqueada',
                              info: '$qtdBloqueada',
                            ),
                            Information(
                              title: 'Qtd. Avaria',
                              info: '$qtdAvaria',
                            ),
                            Information(
                              title: 'Qtd. Reservada',
                              info: '$qtdReservada',
                            ),
                            Information(
                              title: 'Qtd. Disponível',
                              info: '$qtdDisponivel',
                            ),
                            Information(
                              title: 'Data Ult. Entrada',
                              info: '$dtUltEntrada',
                            ),
                            const SizedBox(height: 20),
                            const InformationTitle(
                              title: 'Palete',
                            ),
                            Information(
                              title: 'Tipo Altura Palete',
                              info: '$tipoAlturaPalete',
                            ),
                            Information(
                              title: 'Altura',
                              info: '$alturaPalete',
                            ),
                            Information(
                              title: 'Lastro',
                              info: '$lastroPalete',
                            ),
                            Information(
                              title: 'Quantidade Total Palete',
                              info: '$qtTotalPalete',
                            ),
                            const SizedBox(height: 20),
                            const InformationTitle(
                              title: 'Informações Adicionais',
                            ),
                            Information(
                              title: 'GTIN Unidade Tributável',
                              info: '$gtincodauxiliartrib',
                            ),
                            Information(
                              title: 'EAN Unidade Tributável',
                              info: '$codauxiliartrib',
                            ),
                            Information(
                              title: 'GTIN Unidade Venda',
                              info: '$gtincodauxiliar',
                            ),
                            Information(
                              title: 'Unidade Venda',
                              info: '$codauxiliar',
                            ),
                            Information(
                              title: 'GTIN Unidade Master',
                              info: '$gtincodauxliar2',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, '/home');
          // barcode = await CameraBarcode().scan();
          // setState(() {});
          // print('banco');
          // await pb.admins.authWithPassword(
          //   'gustavohsx07@gmail.com',
          //   'gustavo@13',
          // );
          // final record = await pb
          //     .collection('produto')
          //     .getFirstListItem('codprod="878730"');

          // descricao = record.data['descricao'];
          // codprod = record.data['codprod'];
          // unidade = record.data['unidade'];
          // pesoLiquido = record.data['pesoliq'];
          // pesoBruto = record.data['pesobruto'];
          // codfab = record.data['codfab'];
          // setState(() {});
          // print(record);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.photo_camera_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
