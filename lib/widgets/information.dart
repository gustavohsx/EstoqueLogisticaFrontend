import 'package:flutter/material.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';

class Information extends StatelessWidget {
  final String title;
  final String info;

  const Information({
    required this.title,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: BaseTextStyles.productInformationNormal,
        ),
        Text(
          info,
          style: BaseTextStyles.productInformationBold,
        ),
      ],
    );
  }
}
