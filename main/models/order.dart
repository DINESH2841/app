// lib/models/order.dart
import 'product.dart';

class Order {
  final String id;
  final String customerId;
  final List<Product> products;
  final double total;

  Order({
    required this.id,
    required this.customerId,
    required this.products,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customerId'],
      products: (json['products'] as List).map((e) => Product.fromJson(e, '')).toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'products': products.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}