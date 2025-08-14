import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset('lib/images/nike_Logo.png',
                              height: 24, color: Colors.black),
                        ),
                        const SizedBox(width: 6),
                        Image.asset('lib/images/Nike_jump_icon.png', height: 24),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.search, size: 28, color: Colors.black87),
                ],
              ),

              const SizedBox(height: 24),
              Text(
                "${viewModel.getGreeting()} ${viewModel.userName}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Top Picks for You", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              const Text("Recommended products", style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 12),

              // Top Picks
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.isLoading ? 0 : viewModel.topPicks.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) {
                    final item = viewModel.topPicks[index];
                    final isSelected = viewModel.selectedTopPickIndex == index;

                    return GestureDetector(
                      onTap: () async {
                        await viewModel.selectTopPick(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Product added to cart')),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: SizedBox(
                          width: 150,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: isSelected
                                          ? Border.all(color: Colors.amber, width: 2)
                                          : null,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        item.image,
                                        height: 130,
                                        width: 150,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.image, size: 50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      item.desc,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      "MRP: ${item.price}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: GestureDetector(
                                  onTap: () => viewModel.toggleFavorite(item),
                                  child: Icon(
                                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: item.isFavorite ? Colors.red : Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                  },
                ),
              ),

              const SizedBox(height: 24),

              // New From Nike
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("New From Nike", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: Consumer<HomeViewModel>(
                  builder: (context, viewModel, child) {
                    return viewModel.newNikeImages.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.newNikeImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            viewModel.newNikeImages[index].imageUrl,
                            height: 180,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
