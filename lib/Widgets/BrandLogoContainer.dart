import 'package:flutter/material.dart';

class BrandLogoContainer extends StatelessWidget {
  const BrandLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Nike circle logo
          Container(
            width: 50,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18), // You can adjust the radius as needed
            ),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'lib/images/nike_Logo.png',
                color: Colors.black,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Jumpman logo
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              'lib/images/Nike_jump_icon.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
