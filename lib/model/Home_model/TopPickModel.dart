class TopPickModel {
  final String image;
  final String name;
  final String desc;
  final String price;
  bool isFavorite;

  TopPickModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    this.isFavorite = false,
  });

  factory TopPickModel.fromMap(Map<String, dynamic> map) {
    return TopPickModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'desc': desc,
      'price': price,
      'isFavorite': isFavorite,
    };
  }
}
