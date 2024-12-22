import 'package:flutter/material.dart';
import '../services/prebooking_service.dart';
import '../models/prebooking.dart';

class PrebookingRequests extends StatelessWidget {
  final PrebookingService _prebookingService = PrebookingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prebooking Requests')),
      body: FutureBuilder<List<Prebooking>>(
        future: _prebookingService.getPrebookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading prebooking requests'));
          }

          final prebookings = snapshot.data ?? [];
          if (prebookings.isEmpty) {
            return Center(child: Text('No prebooking requests available.'));
          }

          return ListView.builder(
            itemCount: prebookings.length,
            itemBuilder: (context, index) {
              final prebooking = prebookings[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(prebooking.userName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product ID: ${prebooking.productId}'),
                      Text('Quantity: ${prebooking.quantity}'),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Add functionality to view or manage individual requests.
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
