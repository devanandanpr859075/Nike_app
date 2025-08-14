import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1E0D4D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Order Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Order ID – 0D333577456774351100",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),

          // Product Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("lib/images/img_5.png", width: 70, height: 70, fit: BoxFit.cover),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike SB Dunk Low Pro",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 4),
                      Text("Men’s Road Racing Shoes\nWhite/Black/Univers...",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(height: 4),
                      Text("6 (EU 40)", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 6),
                      Text("MRP: ₹ 23,795.00",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Status Steps
          _buildStep(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: "Order Confirmed, Today",
            lines: [
              "Your Order has been placed.",
              "Fri, 7th Feb‘25 - 2:37pm",
              "Seller is processing your order",
              "Item waiting to be picked up by courier partner.",
              "Fri,7th Feb‘25 - 6:00pm"
            ],
            isLast: false,
          ),
          _buildStep(
            icon: Icons.local_shipping,
            iconColor: Colors.grey,
            title: "Shipped Expected By Fri 7th Feb",
            lines: [
              "Item yet to be Shipped.",
              "Expected by Fri, 7th Feb",
              "Item yet to reach hub nearest to you."
            ],
            isLast: false,
          ),
          _buildStep(
            icon: Icons.directions_bike,
            iconColor: Colors.grey,
            title: "Out For Delivery",
            lines: [
              "Item yet to be delivered.",
            ],
            isLast: false,
          ),
          _buildStep(
            icon: Icons.home,
            iconColor: Colors.grey,
            title: "Delivery Expected By Sun 9th Feb",
            lines: [
              "Item yet to be Shipped.",
              "Expected by Sun, 9th Feb",
            ],
            isLast: true,
          ),

          const SizedBox(height: 24),

          // Edit Order Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Edit Order", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<String> lines,
    required bool isLast,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Icon(icon, size: 22, color: iconColor),
              if (!isLast)
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.grey.shade300,
                ),
            ],
          ),
          const SizedBox(width: 12),

          // Step content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                ...lines.map((line) => Text(
                  line,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
