import 'package:flutter/material.dart';

class Alerts {
  void sucessSaveData(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Alterações salvas com sucesso!'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void cameraError(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro!'),
          content: const Text(
              'Não foi possível abrir a Câmera. Se o problema persistir, Consulte o Suporte!'),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'))
          ],
        );
      },
    );
  }

  void generic(context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta!'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'))
          ],
        );
      },
    );
  }
}
