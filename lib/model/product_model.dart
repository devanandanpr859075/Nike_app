class ProductModel {
  final String name;
  final String type;
  final double price;
  final String image;
  final bool isFavorite;
  final bool isBestseller;

  ProductModel({
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    this.isFavorite = false,
    this.isBestseller = false,
  });
}
