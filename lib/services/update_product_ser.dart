import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class UpdateProductService {
  updateProduct(
      {required String title,
      required dynamic price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
