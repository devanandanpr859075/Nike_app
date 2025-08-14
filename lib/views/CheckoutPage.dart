// main.dart
import 'package:flutter/material.dart';
import 'package:nike_ecom/views/Address%20Input%20Page.dart';
import 'package:nike_ecom/views/OrderSummaryPage.dart';
import 'package:nike_ecom/views/PaymentPage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int currentStep = 0;

  final Color primaryColor = const Color(0xFF1E0D4D);
  final List<String> stepTitles = ["Address", "Order Summary", "Payment"];

  Widget _buildStepTitle(String title, int index) {
    final bool isSelected = currentStep == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => currentStep = index),
        child: Column(
          children: [
            Icon(
              _getStepIcon(index),
              size: 24,
              color: isSelected ? primaryColor : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 3,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getStepIcon(int index) {
    switch (index) {
      case 0:
        return Icons.location_on_outlined;
      case 1:
        return Icons.receipt_long;
      case 2:
        return Icons.payment_outlined;
      default:
        return Icons.circle;
    }
  }

  Widget _getCurrentSection() {
    switch (currentStep) {
      case 0:
        return const AddressPage();
      case 1:
        return const OrderSummaryPage();
      case 2:
        return const PaymentPage();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                stepTitles.length,
                    (index) => _buildStepTitle(stepTitles[index], index),
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: _getCurrentSection(),
            ),
          ),
        ],
      ),
    );
  }
}