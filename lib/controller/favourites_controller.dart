import '../view_models/home_viewmodel.dart';
import '../model/Home_model/TopPickModel.dart';

class FavouritesController {
  final HomeViewModel _homeViewModel = HomeViewModel();

  List<TopPickModel> get favourites => _homeViewModel.favoriteTopPicks;
}
