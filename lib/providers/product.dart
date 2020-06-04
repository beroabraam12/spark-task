import 'package:flutter/cupertino.dart';

class ProductModel {
  String id, name, image;
  int quantity = 0;
  ProductModel({
    @required this.id,
    @required this.name,
    @required this.image,
  });
}

class Product with ChangeNotifier {
  List<ProductModel> _products = [
    ProductModel(
      id: '1',
      name: 'cake',
      image:
          'https://www.bakedbyanintrovert.com/wp-content/uploads/2018/05/Birthday-Cake-Recipe-Image-720x720.jpg',
    ),
    ProductModel(
      id: '2',
      name: 'cheese cake',
      image:
          'https://www.onceuponachef.com/images/2017/12/NY-Cheesecake-760x574.jpg',
    ),
    ProductModel(
      id: '3',
      name: 'Donate cake',
      image:
          'https://image.shutterstock.com/image-photo/chocolate-donuts-sprinkles-isolated-on-260nw-126913403.jpg',
    ),
  ];
  List<ProductModel> _selectedProducts = [];
  List<ProductModel> get products {
    return [..._products];
  }

  List<ProductModel> get selectedProducts {
    return [..._selectedProducts];
  }

  selectProduct(ProductModel p) {
    if (_selectedProducts.contains(p)) {
      _selectedProducts.firstWhere((element) => p.id == element.id).quantity++;
    } else {
      p.quantity++;
      _selectedProducts.insert(0, p);
    }
    notifyListeners();
  }
}
