import 'package:flutter/material.dart';
import 'package:nike_ecom/Widgets/BrandLogoContainer.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectedTab = 0;
  final List<String> tabs = ['Men', 'Women', 'Kids'];

  final List<Map<String, String>> highlights = [
    {"image": "lib/images/img.png", "text": "New\nArrivals"},
    {"image": "lib/images/img_1.png", "text": "Just\nDropped:\nAlphafly 3"},
    {"image": "lib/images/img_2.png", "text": "Nike\nPegasus\npremium"},
    {"image": "lib/images/img_3.png", "text": "Air Force 1"},
    {"image": "lib/images/img_4.png", "text": "Tennis"},
    {"image": "lib/images/img_1.png", "text": "Shop All"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row
                Row(
                  children: [
                    BrandLogoContainer(),
                    const Spacer(),
                    Icon(Icons.search, size: 28, color: Colors.black87),
                  ],
                ),
            
                const SizedBox(height: 12),
                const Text(
                  'Shop',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                /// Tabs (Men, Women, Kids)
                Row(
                  children: List.generate(tabs.length, (index) {
                    bool selected = index == selectedTab;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: selected ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
            
                const SizedBox(height: 20),
            
                const Text(
                  "This Week's Highlights",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  itemCount: highlights.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: AssetImage(highlights[index]["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        highlights[index]["text"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                    );
                  },
                ),
            
                const SizedBox(height: 20),
            
                /// Bottom Big Cards
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    'lib/images/img_5.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
            
                const SizedBox(height: 12),
            
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    'lib/images/img_6.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
