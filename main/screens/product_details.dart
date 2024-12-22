// lib/screens/product_details.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/prebooking_service.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  final PrebookingService _prebookingService = PrebookingService();

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _quantityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Price: \$${product.price}'),
          Text('Available: ${product.quantity}'),
          TextField(
            controller: _quantityController,
            decoration: InputDecoration(labelText: 'Enter quantity to prebook'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              final quantity = int.parse(_quantityController.text);
              _prebookingService.createPrebooking(product.id, 'User123', 'John Doe', quantity);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Prebooking successful')));
            },
            child: Text('Prebook'),
          ),
        ],
      ),
    );
  }
}
