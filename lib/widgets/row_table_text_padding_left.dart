import 'package:flutter/material.dart';

class RowTableTextPaddingLeft extends StatelessWidget {
  final dynamic texto;
  const RowTableTextPaddingLeft(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        '${texto}',
        textAlign: TextAlign.left,
      ),
    );
  }
}
