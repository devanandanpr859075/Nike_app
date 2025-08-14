class UserModel {
  final String name;
  final String profileImage;
  final int inboxCount;
  final int followingCount;

  UserModel({
    required this.name,
    required this.profileImage,
    this.inboxCount = 0,
    this.followingCount = 0,
  });
}
