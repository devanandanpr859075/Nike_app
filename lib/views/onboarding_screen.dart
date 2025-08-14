import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tracker/progress_tracker.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  final int currentStep = 1; // 0-based: 0 = confirmed, 1 = shipped, etc.

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1E0D4D);

    final statusList = [
      Status(name: 'Order Confirmed', icon: Icons.check_circle),
      Status(name: 'Shipped', icon: Icons.local_shipping),
      Status(name: 'Out For Delivery', icon: Icons.directions_bike),
      Status(name: 'Delivered', icon: Icons.home),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 30),
          ProgressTracker(
            currentIndex: currentStep,
            statusList: statusList,
            activeColor: primaryColor,
            inActiveColor: Colors.grey.shade300,
            showStepNumber: false,
            trackerAtStart: true,
          ),
          const SizedBox(height: 24),
          // Edit Order button ...
        ],
      ),
    );
  }
}
