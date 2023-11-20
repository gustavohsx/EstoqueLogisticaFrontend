import 'package:estoque_logistica/config/shared_pref.dart';
import 'package:estoque_logistica/widgets/alerts.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  SharedPref sharedPref = SharedPref();
  Alerts alerts = Alerts();
  late String server = '';
  late String user = 'Alterar Usuário';
  late String password = 'Alterar Senha';
  late TextEditingController _enderecoController;
  late TextEditingController _userController;
  late TextEditingController _passwordController;

  getServer() async {
    server = await sharedPref.read('server') ?? 'https://spessoa.fly.dev';
    setState(() {});
  }

  saveData() {
    _enderecoController.text.isNotEmpty
        ? sharedPref.save('server', _enderecoController.text)
        : '';
    _userController.text.isNotEmpty
        ? sharedPref.save('user', _userController.text)
        : '';
    _passwordController.text.isNotEmpty
        ? sharedPref.save('password', _passwordController.text)
        : '';
    alerts.sucessSaveData(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _enderecoController = TextEditingController();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    getServer();
  }

  void confirmationSaveData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Confirma a Alteração dos Dados'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                saveData();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Endereço do Servidor'),
            const SizedBox(height: 15),
            SizedBox(
              child: TextField(
                controller: _enderecoController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: server,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Usuário'),
            const SizedBox(height: 15),
            SizedBox(
              child: TextField(
                controller: _userController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: user,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Senha'),
            const SizedBox(height: 15),
            SizedBox(
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: password,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: () => confirmationSaveData(),
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
