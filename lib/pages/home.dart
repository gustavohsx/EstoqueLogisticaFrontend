import 'package:estoque_logistica/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:estoque_logistica/barcode/barcode.dart';

final pb = PocketBase('https://spessoa.fly.dev');

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void goProductInfo(String id) {
    Navigator.pushNamed(context, '/product', arguments: id);
  }

  void searchProduct(codigo) async {
    print(codigo);
    await pb.collection('users').authWithPassword(
          'default',
          'Sorriso.123',
        );
    try {
      print('entou try');
      RecordModel record = await pb
          .collection('produto')
          .getFirstListItem('codprod="$codigo" || codauxiliar="$codigo"');
      print('ID: ${record.id}');
      goProductInfo(record.id);
      // print(record);
    } catch (e) {
      print('Produto não encontrado! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verificar Estoque',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Inserir Código/Código de Barras'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Digite o código'),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      var codigo = _controller.text;
                      searchProduct(codigo);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Buscar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      print('cliquei abrir camera');
                      CameraBarcode cam = CameraBarcode();
                      String codigo = await cam.scan();
                      searchProduct(codigo);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Escanear Código',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
