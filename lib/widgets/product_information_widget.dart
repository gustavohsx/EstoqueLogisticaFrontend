import 'package:estoque_logistica/models/product_model.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';
import 'package:estoque_logistica/widgets/information.dart';
import 'package:estoque_logistica/widgets/information_title.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final ProductModel produto;
  const ProductInformationWidget(this.produto, {super.key});

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
                Text(
                  produto.descricao,
                  style: BaseTextStyles.productTitle,
                ),
                Text(
                  '${produto.codprod}',
                  style: BaseTextStyles.productSubTitle,
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InformationTitle(
                      title: 'Informações',
                    ),
                    Information(
                      title: 'Embalagem',
                      info: produto.embalagem,
                    ),
                    Information(
                      title: 'Unidade',
                      info: produto.unidade,
                    ),
                    Information(
                      title: 'Peso Liquido',
                      info: '${produto.pesoliq} kg',
                    ),
                    Information(
                      title: 'Peso Bruto',
                      info: '${produto.pesobruto} kg',
                    ),
                    Information(
                      title: 'Cod. Fabrica',
                      info: produto.codfab,
                    ),
                    const SizedBox(height: 20),
                    const InformationTitle(
                      title: 'Endereço',
                    ),
                    Information(
                      title: 'Modulo',
                      info: '${produto.modulo}',
                    ),
                    Information(
                      title: 'Rua',
                      info: '${produto.rua}',
                    ),
                    Information(
                      title: 'Número',
                      info: '${produto.numero}',
                    ),
                    Information(
                      title: 'Apartamento',
                      info: '${produto.apto}',
                    ),
                    const SizedBox(height: 20),
                    const InformationTitle(
                      title: 'Estoque',
                    ),
                    Information(
                      title: 'Qtd. Geral',
                      info: '${produto.qtestger}',
                    ),
                    Information(
                      title: 'Qtd. Bloqueada',
                      info: '${produto.qtbloqueada}',
                    ),
                    Information(
                      title: 'Qtd. Avaria',
                      info: '${produto.qtindeniz}',
                    ),
                    Information(
                      title: 'Qtd. Reservada',
                      info: '${produto.qtreservada}',
                    ),
                    Information(
                      title: 'Qtd. Disponível',
                      info: '${produto.qtdisponivel}',
                    ),
                    Information(
                      title: 'Data Ult. Entrada',
                      info: produto.dtultent,
                    ),
                    const SizedBox(height: 20),
                    const InformationTitle(
                      title: 'Palete',
                    ),
                    Information(
                      title: 'Tipo Altura Palete',
                      info: '${produto.tipoalturapelete}',
                    ),
                    Information(
                      title: 'Altura',
                      info: '${produto.alturapal}',
                    ),
                    Information(
                      title: 'Lastro',
                      info: '${produto.lastropal}',
                    ),
                    Information(
                      title: 'Quantidade Total Palete',
                      info: '${produto.qttotal}',
                    ),
                    const SizedBox(height: 20),
                    const InformationTitle(
                      title: 'Informações Adicionais',
                    ),
                    Information(
                      title: 'GTIN Unidade Tributável',
                      info: produto.gtincodauxiliartrib,
                    ),
                    Information(
                      title: 'EAN Unidade Tributável',
                      info: produto.codauxiliartrib,
                    ),
                    Information(
                      title: 'GTIN Unidade Venda',
                      info: produto.gtincodauxiliar,
                    ),
                    Information(
                      title: 'Unidade Venda',
                      info: produto.codauxiliar,
                    ),
                    Information(
                      title: 'GTIN Unidade Master',
                      info: produto.gtincodauxiliar2,
                    ),
                    Information(
                      title: 'Unidade Master',
                      info: produto.codauxiliar2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
