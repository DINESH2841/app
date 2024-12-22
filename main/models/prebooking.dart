// lib/models/prebooking.dart
class Prebooking {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final int quantity;

  Prebooking({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.quantity,
  });

  factory Prebooking.fromJson(Map<String, dynamic> json, String id) {
    return Prebooking(
      id: id,
      productId: json['productId'],
      userId: json['userId'],
      userName: json['userName'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'userId': userId,
      'userName': userName,
      'quantity': quantity,
    };
  }
}