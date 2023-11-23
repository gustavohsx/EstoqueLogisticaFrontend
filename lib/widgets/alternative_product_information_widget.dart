import 'package:estoque_logistica/models/product_model.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:estoque_logistica/widgets/row_table_text_padding.dart';
import 'package:estoque_logistica/widgets/row_table_text_padding_bold.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Table(
                    children: [
                      TableRow(
                        children: [
                          const Text(
                            'CÓDIGO:',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '${produto.codprod}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                child: Column(
                  children: [
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(1.5),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(3),
                      },
                      children: [
                        const TableRow(
                          children: [
                            RowTableTextPadding('EMBAL'),
                            RowTableTextPadding('UND'),
                            RowTableTextPadding('COD. FABRICA'),
                            RowTableTextPadding('ULT. ENTRADA'),
                          ],
                        ),
                        TableRow(
                          children: [
                            RowTableTextPaddingBold(produto.embalagem),
                            RowTableTextPaddingBold(produto.unidade),
                            RowTableTextPaddingBold(produto.codfab),
                            RowTableTextPaddingBold(produto.dtultent),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'ENDEREÇO',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      children: [
                        const TableRow(
                          children: [
                            RowTableTextPadding('MOD'),
                            RowTableTextPadding('RUA'),
                            RowTableTextPadding('PRED'),
                            RowTableTextPadding('APTO'),
                          ],
                        ),
                        TableRow(
                          children: [
                            RowTableTextPaddingBold(produto.modulo),
                            RowTableTextPaddingBold(produto.rua),
                            RowTableTextPaddingBold(produto.numero),
                            RowTableTextPaddingBold(produto.apto),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'ESTOQUE',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      children: [
                        const TableRow(
                          children: [
                            RowTableTextPadding('GERAL'),
                            RowTableTextPadding('BLOQ'),
                            RowTableTextPadding('AVARIA'),
                            RowTableTextPadding('DISPONIVEL'),
                          ],
                        ),
                        TableRow(
                          children: [
                            RowTableTextPaddingBold(produto.qtestger),
                            RowTableTextPaddingBold(produto.qtdisponivel),
                            RowTableTextPaddingBold(produto.qtindeniz),
                            RowTableTextPaddingBold(produto.qtdisponivel),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'PALETIZAÇÃO',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      children: [
                        const TableRow(
                          children: [
                            RowTableTextPadding('TIPO'),
                            RowTableTextPadding('ALT'),
                            RowTableTextPadding('LASTRO'),
                            RowTableTextPadding('QTD PALETE'),
                          ],
                        ),
                        TableRow(
                          children: [
                            RowTableTextPaddingBold(produto.tipoalturapelete),
                            RowTableTextPaddingBold(produto.alturapal),
                            RowTableTextPaddingBold(produto.lastropal),
                            RowTableTextPaddingBold(produto.qttotal),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'INFORMAÇÕES ADICIONAIS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      children: [
                        const TableRow(
                          children: [
                            RowTableTextPadding('PESO LIQ'),
                            RowTableTextPadding('PESO BRUTO'),
                          ],
                        ),
                        TableRow(
                          children: [
                            RowTableTextPaddingBold(produto.pesoliq),
                            RowTableTextPaddingBold(produto.pesobruto),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'CÓDIGO DE BARRAS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.symmetric(inside: const BorderSide()),
                      children: [
                        TableRow(
                          children: [
                            const RowTableTextPadding('GTIN Unid. Tributável:'),
                            RowTableTextPaddingBold(
                                'GTIN - ${produto.gtincodauxiliartrib}'),
                          ],
                        ),
                        TableRow(
                          children: [
                            const RowTableTextPadding('EAN Unid. Tributável:'),
                            RowTableTextPaddingBold(produto.codauxiliartrib),
                          ],
                        ),
                        TableRow(
                          children: [
                            const RowTableTextPadding('GTIN Unid. Venda:'),
                            RowTableTextPaddingBold(
                                'GTIN - ${produto.gtincodauxiliar}'),
                          ],
                        ),
                        TableRow(
                          children: [
                            const RowTableTextPadding('Unidade Venda:'),
                            RowTableTextPaddingBold(produto.codauxiliar),
                          ],
                        ),
                        TableRow(
                          children: [
                            const RowTableTextPadding('GTIN Unid. Master:'),
                            RowTableTextPaddingBold(
                                'GTIN - ${produto.gtincodauxiliar2}'),
                          ],
                        ),
                        TableRow(
                          children: [
                            const RowTableTextPadding('Unidade Master:'),
                            RowTableTextPaddingBold(produto.codauxiliar2),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
