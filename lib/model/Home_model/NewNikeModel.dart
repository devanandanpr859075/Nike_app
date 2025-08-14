class NewNikeModel {
  final String imageUrl;

  NewNikeModel({required this.imageUrl});

  factory NewNikeModel.fromMap(Map<String, dynamic> map) {
    return NewNikeModel(
      imageUrl: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': imageUrl,
    };
  }
}
