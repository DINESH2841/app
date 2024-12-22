// lib/screens/customer_home.dart
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../services/product_service.dart';
import '../models/product.dart';

class CustomerHome extends StatelessWidget {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop')),
      body: FutureBuilder<List<Product>>(
        future: _productService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading products'));
          }
          final products = snapshot.data ?? [];
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}
