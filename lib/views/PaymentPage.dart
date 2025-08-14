import 'package:flutter/material.dart';

enum PaymentMethod { upi, card, bank, cash }

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod selectedMethod = PaymentMethod.upi;
  String selectedUPI = 'Paypal';
  String selectedBank = '';

  final Color primaryColor = const Color(0xFF1E0D4D);
  final Color borderColor = const Color(0xFFE0E0E0);

  final List<String> upiOptions = ['Paypal', 'Gpay', 'Paytm', 'PhonePe'];
  final Map<String, String> upiImages = {
    'Paypal': 'lib/images/img_7.png',
    'Gpay': 'lib/images/img_8.png',
    'Paytm': 'lib/images/img_9.png',
    'PhonePe': 'lib/images/img_10.png',
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Men’s Road Racing Shoes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text("6 (EU 40)", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          _priceRow("Subtotal", "₹ 23,795.00"),
          _priceRow("Delivery", "₹ 1,250.00"),
          const Divider(height: 30, thickness: 1),
          _priceRow("Total", "₹ 25,045.00", isBold: true),
          const SizedBox(height: 24),
          _paymentTabs(),
          const SizedBox(height: 20),
          _buildPaymentOptions(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // Handle order placement
              },
              child: const Text("Place Order", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 15, fontWeight: isBold ? FontWeight.w600 : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: isBold ? FontWeight.w600 : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _paymentTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: PaymentMethod.values.map((method) {
        final isSelected = selectedMethod == method;
        final icon = _getIconForMethod(method);
        final label = _getLabelForMethod(method);
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => selectedMethod = method),
            child: Container(
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isSelected ? primaryColor : borderColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: isSelected ? Colors.white : Colors.black87),
                  const SizedBox(height: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  IconData _getIconForMethod(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.upi:
        return Icons.account_balance_wallet_outlined;
      case PaymentMethod.card:
        return Icons.credit_card;
      case PaymentMethod.bank:
        return Icons.account_balance;
      case PaymentMethod.cash:
        return Icons.money;
    }
  }

  String _getLabelForMethod(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.upi:
        return 'UPI';
      case PaymentMethod.card:
        return 'Card';
      case PaymentMethod.bank:
        return 'Bank';
      case PaymentMethod.cash:
        return 'Cash';
    }
  }

  Widget _buildPaymentOptions() {
    switch (selectedMethod) {
      case PaymentMethod.upi:
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: upiOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedUPI,
                onChanged: (value) => setState(() => selectedUPI = value!),
                secondary: Image.asset(
                  upiImages[option]!,
                  width: 40,
                  height: 48,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported_outlined),
                ),
              );
            }).toList(),
          ),
        );

      case PaymentMethod.card:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: _inputDecoration("Card Number"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: TextField(decoration: _inputDecoration("MM/YY"))),
                const SizedBox(width: 12),
                Expanded(child: TextField(decoration: _inputDecoration("CVV"))),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: const Text('Done', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );

      case PaymentMethod.bank:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              _bankTile("HDFC Bank"),
              _bankTile("State Bank of India"),
              _bankTile("ICICI Bank"),
              TextButton(onPressed: () {}, child: const Text('All Other Banks')),
            ],
          ),
        );

      case PaymentMethod.cash:
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Cash on Delivery selected.\nYou will pay ₹25,045.00 when your order arrives.',
            style: TextStyle(fontSize: 15),
          ),
        );
    }
  }

  Widget _bankTile(String bankName) {
    return RadioListTile<String>(
      title: Text(bankName),
      value: bankName,
      groupValue: selectedBank,
      onChanged: (val) => setState(() => selectedBank = val!),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
