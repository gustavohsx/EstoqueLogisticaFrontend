import 'package:flutter/material.dart';
import 'package:estoque_logistica/style/base_text_styles.dart';

class InformationTitle extends StatelessWidget {
  final String title;

  const InformationTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$title: ',
          style: BaseTextStyles.informationTitleBold,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
