import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Home_model/TopPickModel.dart';
import '../model/Home_model/NewNikeModel.dart';

class HomeViewModel extends ChangeNotifier {
  String userName = "John Smith";
  int selectedTopPickIndex = -1;

  List<TopPickModel> topPicks = [];
  List<NewNikeModel> newNikeImages = [];
  bool isLoading = false;

  HomeViewModel() {
    fetchTopPicks();
    fetchNewNikeImages();
  }

  void toggleFavorite(TopPickModel product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<TopPickModel> get favoriteTopPicks =>
      topPicks.where((item) => item.isFavorite).toList();

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  Future<void> fetchTopPicks() async {
    isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance.collection('top_picks').get();

      topPicks = snapshot.docs.map((doc) {
        final data = doc.data();
        return TopPickModel.fromMap(data);
      }).toList();
    } catch (e) {
      debugPrint("Error fetching top picks: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchNewNikeImages() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('New_Nike').get();

      newNikeImages = snapshot.docs.map((doc) {
        return NewNikeModel.fromMap(doc.data());
      }).toList();

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching New Nike images: $e');
    }
  }
  Future<void> selectTopPick(int index) async {
    selectedTopPickIndex = index;
    notifyListeners();

    final selectedItem = topPicks[index];
    await addToCart(selectedItem);
  }

  Future<void> addToCart(TopPickModel product) async {
    try {
      await FirebaseFirestore.instance.collection('cart').add(product.toMap());
      debugPrint("Product added to cart: ${product.name}");
    } catch (e) {
      debugPrint("Failed to add to cart: $e");
    }
  }
}
