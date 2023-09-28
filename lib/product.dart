import 'package:flutter/material.dart';

class Product {

    Product({
      required this.id,
      required this.title,
      required this.description,
      this.isExpanded = false
    });

  int id;
  String title;
  String description;
  bool isExpanded;

  static List<Product> generateItens(int numberOfItens){
    return List<Product>.generate(numberOfItens, (int index)  {
      return Product(id: index+1, title: 'Produto ${index+1}', description: 'Descrição do produto ${index+1}');
    });
  }
}