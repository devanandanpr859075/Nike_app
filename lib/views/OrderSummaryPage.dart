import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final Color primaryColor = const Color(0xFF1E0D4D);
  final String productImage = 'lib/images/img_6.png';
  int quantity = 1;
  final double price = 23795.0;
  final double delivery = 1250.0;

  @override
  Widget build(BuildContext context) {
    double subtotal = price * quantity;
    double total = subtotal + delivery;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 24),

        const Text("Delivery to:",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 10),

        /// ---- Delivery Address ----
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Smith",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                    SizedBox(height: 6),
                    Text(
                      "Quisque fermentum ipsum vitae diam sagittis malesuada. Ut rutrum venenatis sem, non molestie leo vehicula a.",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.home_outlined, size: 14),
                    SizedBox(width: 4),
                    Text("Home",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.edit, size: 18, color: Colors.black),
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// ---- Product Card ----
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.12),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  productImage,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Men’s Road Racing Shoes",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                    SizedBox(height: 6),
                    Text("White/Black/University Red\n6 (EU 40)",
                        style: TextStyle(fontSize: 11.5, color: Colors.black54)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// ---- Quantity Dropdown ----
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Qty",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            DropdownButton<int>(
              value: quantity,
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black, fontSize: 13),
              items: List.generate(
                  10,
                      (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Text((i + 1).toString()),
                  )),
              onChanged: (val) {
                if (val != null) {
                  setState(() => quantity = val);
                }
              },
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// ---- Price Details ----
        const Text("Price Details",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 10),
        _priceRow("Subtotal", "₹ ${subtotal.toStringAsFixed(2)}"),
        _priceRow("Delivery", "₹ ${delivery.toStringAsFixed(2)}"),
        _priceRow("Total", "₹ ${total.toStringAsFixed(2)}", isTotal: true),

        const SizedBox(height: 54),

        /// ---- Continue Button ----
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text("Continue",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  Widget _priceRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: isTotal ? 13.5 : 12.5,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              )),
          Text(amount,
              style: TextStyle(
                fontSize: isTotal ? 13.5 : 12.5,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              )),
        ],
      ),
    );
  }
}
