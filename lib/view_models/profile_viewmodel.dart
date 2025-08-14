import '../model/UserModel.dart';
import '../model/user_model.dart';

class ProfileViewModel {
  UserModel getUser() {
    return UserModel(
      name: "John Smith",
      profileImage: "lib/images/BAck.png",
      inboxCount: 2,
      followingCount: 19,
    );
  }
}

