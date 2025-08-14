import 'package:nike_ecom/model/ProfileModel.dart';


class ProfileController {
  final ProfileModel user = ProfileModel(
    name: 'John Doe',
    profileImage: 'lib/images/BackGround.png',
    inboxCount: 5,
    followingCount: 3,
    followingImages: [
      'lib/images/img_3.png',
      'lib/images/img_4.png',
      'lib/images/img_5.png',
      'lib/images/img_6.png',
      'lib/images/img_1.png',
    ],
  );
}
