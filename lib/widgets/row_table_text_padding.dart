import 'package:flutter/material.dart';

class RowTableTextPadding extends StatelessWidget {
  final dynamic texto;
  const RowTableTextPadding(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text('${texto}'),
    );
  }
}
