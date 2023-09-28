
import 'package:card_expand/product.dart';
import 'package:flutter/material.dart';


class ExpansionPage extends StatefulWidget {
  const ExpansionPage({Key? key}) : super(key: key);

  @override
  State<ExpansionPage> createState() => _ExpansionPageState();
}

class _ExpansionPageState extends State<ExpansionPage> {
  final List<Product> _products = Product.generateItens(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded){
              setState(() => _products[index].isExpanded = !isExpanded);
            },
            children: _products.map<ExpansionPanel>((Product product){
              return ExpansionPanel(
                isExpanded: product.isExpanded,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded){
                  return ListTile(
                    leading: CircleAvatar(child: Text(product.id.toString())),
                    title:  Text(product.title),
                  );
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(product.description),
                    ),
                    Image.network('https://picsum.photos/id/${product.id}/500/300'),
                  ],
                )
              );
            }).toList(),
            )
          ),
        ),
      );
  }
}
