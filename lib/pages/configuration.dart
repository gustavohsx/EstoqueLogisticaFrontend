import 'package:estoque_logistica/config/shared_pref.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  SharedPref sharedPref = SharedPref();
  late String server;
  late TextEditingController _enderecoController;

  getServer() async {
    server = await sharedPref.read('server') ?? 'Endereço do Servidor';
  }

  @override
  void initState() {
    super.initState();
    _enderecoController = TextEditingController();
    getServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: TextField(
                controller: _enderecoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(server),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sharedPref.save('server', _enderecoController.text);
              },
              child: Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
