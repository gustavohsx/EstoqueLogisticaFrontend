import 'package:estoque_logistica/models/product_model.dart';
import 'package:estoque_logistica/repositoty/product_repository.dart';
import 'package:estoque_logistica/widgets/alerts.dart';
import 'package:estoque_logistica/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:estoque_logistica/barcode/barcode.dart';
// import 'package:estoque_logistica/error.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _controller;
  Alerts alerts = Alerts();
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void goProductInfo(ProductModel produto) {
    Navigator.pushNamed(context, '/product', arguments: produto);
  }

  void showErrorMessage(message) {
    // Error error = Error();
    // alerts.generic(context, error.searchError(message));
    alerts.generic(context, message);
  }

  void showErrorMessageCamera() {
    alerts.cameraError(context);
  }

  void searchProduct(String codigo) async {
    setState(() {
      carregando = true;
    });
    final repositorio = ProductRepository();
    dynamic produto = await repositorio.findOneProduct(codigo);
    if (produto.runtimeType != ProductModel) {
      showErrorMessage(produto);
    } else {
      goProductInfo(produto);
    }
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
      appBar: AppBar(
        title: const Text(
          'Verificar Estoque',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Inserir Código/Código de Barras'),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      child: TextField(
                        controller: _controller,
                        onTap: () {
                          _controller.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: _controller.value.text.length);
                        },
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            searchProduct(value);
                          }
                        },
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
                        FocusManager.instance.primaryFocus?.unfocus();
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
                    carregando
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        CameraBarcode cam = CameraBarcode();
                        String codigo = await cam.scan();
                        if (codigo == '-1') {
                          showErrorMessage(codigo);
                        } else if (codigo == 'null') {
                          showErrorMessageCamera();
                        } else {
                          _controller.text = codigo;
                          setState(() {});
                          searchProduct(codigo);
                        }
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
