// import 'package:estoque_logistica/barcode/barcode.dart';
import 'package:estoque_logistica/widgets/custom_drawer.dart';
import 'package:estoque_logistica/widgets/information.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://127.0.0.1:8090');

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
  int? qtd_geral = 0;
  int? qtd_bloqueada = 0;
  int? qtd_avaria = 0;
  int? qtd_reservada = 0;
  int? qtd_disponivel = 0;
  String? dt_ult_entrada = 'Colocar';
  int? tipo_altura_palete = 0;
  int? altura_palete = 0;
  int? lastro_palete = 0;
  int? qt_total_palete = 0;
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
    await pb.admins.authWithPassword(
      'gustavohsx07@gmail.com',
      'gustavo@13',
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
      qtd_geral = record.data['qtestger'];
      qtd_bloqueada = record.data['qtbloqueada'];
      qtd_avaria = record.data['qtindeniz'];
      qtd_reservada = record.data['qtreservada'];
      qtd_disponivel = record.data['qtdisponivel'];
      dt_ult_entrada = 'Colocar';
      tipo_altura_palete = record.data['tipoalturapalete'];
      altura_palete = record.data['alturapal'];
      lastro_palete = record.data['lastropal'];
      qt_total_palete = record.data['qttotpal'];
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
    final received_id = ModalRoute.of(context)!.settings.arguments as String?;
    if (received_id != id) {
      id = received_id;
      attDataProduct(received_id);
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
                              info: '$qtd_geral',
                            ),
                            Information(
                              title: 'Qtd. Bloqueada',
                              info: '$qtd_bloqueada',
                            ),
                            Information(
                              title: 'Qtd. Avaria',
                              info: '$qtd_avaria',
                            ),
                            Information(
                              title: 'Qtd. Reservada',
                              info: '$qtd_reservada',
                            ),
                            Information(
                              title: 'Qtd. Disponível',
                              info: '$qtd_disponivel',
                            ),
                            Information(
                              title: 'Data Ult. Entrada',
                              info: 'Colocar isso',
                            ),
                            const SizedBox(height: 20),
                            const InformationTitle(
                              title: 'Palete',
                            ),
                            Information(
                              title: 'Tipo Altura Palete',
                              info: '$tipo_altura_palete',
                            ),
                            Information(
                              title: 'Altura',
                              info: '$altura_palete',
                            ),
                            Information(
                              title: 'Lastro',
                              info: '$lastro_palete',
                            ),
                            Information(
                              title: 'Quantidade Total Palete',
                              info: '$qt_total_palete',
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
