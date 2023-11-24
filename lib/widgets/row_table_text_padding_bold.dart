import 'package:flutter/material.dart';

class RowTableTextPaddingBold extends StatelessWidget {
  final dynamic texto;
  const RowTableTextPaddingBold(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        '${texto}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
