import 'package:flutter/material.dart';

import '../Widgets/OrderCard.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Order", style: TextStyle(color: Colors.black)),
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Product",
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Search", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

          // Orders Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: const [
                  OrderCard(
                    status: "Delivered on Feb 07",
                    title: "Nike SB Dunk Low pro",
                    imagePath: "lib/images/img_4.png",
                  ),
                  OrderCard(
                    status: "Delivered on Dec 25",
                    title: "Nike Alphafly 3 Pre...",
                    imagePath: "lib/images/img_4.png",
                  ),
                  OrderCard(
                    status: "Refund Completed",
                    title: "Nike Zoom Air Pro",
                    imagePath: "lib/images/img_4.png",
                    statusColor: Colors.orange,
                  ),
                  OrderCard(
                    status: "Cancelled on Nov 10",
                    title: "Nike Air Force Max",
                    imagePath: "lib/images/img_4.png",
                    statusColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
