import 'package:estoque_logistica/models/product_model.dart';
import 'package:estoque_logistica/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel produto =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          produto.descricao ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductInformationWidget(produto),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, '/home');
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.photo_camera_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
