class ProfileModel {
  final String name;
  final String profileImage;
  final int inboxCount;
  final int followingCount;
  final List<String> followingImages;

  ProfileModel({
    required this.name,
    required this.profileImage,
    required this.inboxCount,
    required this.followingCount,
    required this.followingImages,
  });
}
