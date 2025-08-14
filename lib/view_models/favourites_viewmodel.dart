import '../model/product_model.dart';

class FavouritesViewModel {
  List<ProductModel> getFavouriteProducts() {
    return [
      ProductModel(
        name: "Nike SB Dunk Low Pro",
        type: "Bestseller",
        price: 23795.00,
        image: "lib/images/img_6.png",
        isFavorite: true,
        isBestseller: true,
      ),
      ProductModel(
        name: "Nike Alphafly 4 Premium",
        type: "Bestseller",
        price: 23795.00,
        image: "lib/images/img_5.png",
        isFavorite: true,
        isBestseller: true,
      ),
    ];
  }
}
