import 'package:flutter/material.dart';
import 'package:nike_ecom/views/order_details_page.dart';

class OrderCard extends StatelessWidget {
  final String status;
  final String title;
  final String imagePath;
  final Color statusColor;

  const OrderCard({
    super.key,
    required this.status,
    required this.title,
    required this.imagePath,
    this.statusColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OrderDetailsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(imagePath, height: 80,fit: BoxFit.fill,)),
            const SizedBox(height: 8),
            Text(
              status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star_border, size: 16, color: Colors.black),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              "Rate this product now",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
