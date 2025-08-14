import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'my_orders_page.dart'; // Create this file or comment out if not needed

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? selectedSize;
  int currentImageIndex = 0;

  final List<String> images = [
    'lib/images/img_5.png',
    'lib/images/img_6.png',
    'lib/images/img_2.png',
  ];
  final sizes = [6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Nike SB Dunk Low Pro",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Carousel with overlay buttons
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                  ),
                  items: images.map((imgPath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgPath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 10,
                right: 16,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 6,
                      child: IconButton(
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 8), // spacing between buttons
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //   elevation: 6,
                    //   child: IconButton(
                    //     icon: const Icon(
                    //       Icons.share_outlined,
                    //       color: Colors.black,
                    //     ),
                    //     // onPressed: () {
                    //     //   Share.share('Check out this Nike SB Dunk Low Pro!');
                    //     // },
                    //   ),
                    // ),
                  ],
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: index == currentImageIndex
                            ? Colors.black
                            : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Product Info
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nike SB Dunk Low Pro",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Skate Shoes",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "MRP : ₹ 23,795.00",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Inclusive of all taxes\n( also includes all applicable duties )",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Size - UK",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: sizes.map((size) {
                        final isSelected = selectedSize == size;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            width: 46,
                            height: 46,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                              isSelected ? Colors.black : Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.4,
                              ),
                            ),
                            child: Text(
                              "$size",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                isSelected ? Colors.white : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add to Bag and Buy Now Buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: const Text("Add to Bag",
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyOrdersPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: const Text("Buy Now",
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
