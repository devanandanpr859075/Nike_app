import 'package:nike_ecom/view_models/BagViewModel.dart';

import '../model/product_model.dart';

class BagController {
  final BagViewModel _viewModel = BagViewModel();

  ProductModel get product => _viewModel.getBagItem();
  double get delivery => _viewModel.deliveryFee;
  double get total => _viewModel.total;
}
