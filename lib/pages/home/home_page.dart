// import 'package:estoque_logistica/barcode/barcode.dart';
import 'package:estoque_logistica/widgets/custom_drawer.dart';
import 'package:estoque_logistica/widgets/information.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://127.0.0.1:8090');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String barcode = 'Nada';
  String descricao = '';
  int codprod = 0;
  String unidade = '';
  double? peso_liquido = 0.0;
  double? peso_bruto = 0.0;
  String codfab = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estoque',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Produto:',
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
                          descricao,
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
                            title: 'Unidade',
                            info: '$unidade',
                          ),
                          Information(
                            title: 'Peso Liquido',
                            info: '$peso_liquido',
                          ),
                          Information(
                            title: 'Peso Bruto',
                            info: '$peso_bruto',
                          ),
                          Information(
                            title: 'Cod. Fabrica',
                            info: '$codfab',
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
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // barcode = await CameraBarcode().scan();
          // setState(() {});
          print('banco');
          await pb.admins.authWithPassword(
            'gustavohsx07@gmail.com',
            'gustavo@13',
          );
          final record = await pb
              .collection('produto')
              .getFirstListItem('codprod="878730"');

          descricao = record.data['descricao'];
          codprod = record.data['codprod'];
          unidade = record.data['unidade'];
          peso_liquido = record.data['pesoliq'];
          peso_bruto = record.data['pesobruto'];
          codfab = record.data['codfab'];
          setState(() {});
          print(record);
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
