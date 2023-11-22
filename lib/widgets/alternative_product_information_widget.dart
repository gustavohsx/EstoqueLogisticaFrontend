import 'package:estoque_logistica/models/product_model.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:estoque_logistica/widgets/information.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:flutter/material.dart';

class AlternativeProductInformationWidget extends StatelessWidget {
  final ProductModel produto;
  const AlternativeProductInformationWidget(this.produto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Row(
                  children: [
                    const Text('Código:'),
                    Text(
                      '${produto.codprod}',
                      style: BaseTextStyles.productSubTitle,
                    ),
                  ],
                ),
                Text(
                  produto.descricao,
                  style: BaseTextStyles.productTitle,
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
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    children: [
                      Text('EMBAL.'),
                      Text('UND'),
                      Text('COD. FABRICA'),
                      Text('ULT. ENTRADA')
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(produto.embalagem),
                      Text(produto.unidade),
                      Text(produto.codfab),
                      Text(produto.dtultent),
                    ],
                  ),
                  const TableRow(children: [
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                  ]),
                  const TableRow(
                    children: [
                      Text('MOD'),
                      Text('RUA'),
                      Text('PRED'),
                      Text('APTO'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("${produto.modulo}"),
                      Text("${produto.rua}"),
                      Text("${produto.numero}"),
                      Text("${produto.apto}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
