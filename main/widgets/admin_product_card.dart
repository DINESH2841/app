import 'package:flutter/material.dart';
import '../models/product.dart';

class AdminProductCard extends StatelessWidget {
  final Product product;

  AdminProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.title),
        subtitle: Text('Price: \$${product.price}'),
        trailing: Icon(Icons.edit),
        onTap: () {
          // Navigate to edit screen for this product.
        },
      ),
    );
  }
}
