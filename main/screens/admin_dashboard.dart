// lib/screens/admin_dashboard.dart
import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'edit_product_screen.dart';
import 'prebooking_requests.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddProductScreen())),
            child: Text('Add Product'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditProductScreen())),
            child: Text('Edit Products'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PrebookingRequests())),
            child: Text('View Prebooking Requests'),
          ),
        ],
      ),
    );
  }
}