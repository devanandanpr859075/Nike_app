import '../model/product_model.dart';

class BagViewModel {
  ProductModel getBagItem() {
    return ProductModel(
      name: "Nike Alphafly 3 Premium",
      type: "Men’s Road Racing Shoes",
      price: 23795.00,
      image: "lib/images/img_6.png",
    );
  }

  double get deliveryFee => 1250.00;
  double get total => getBagItem().price + deliveryFee;
}
