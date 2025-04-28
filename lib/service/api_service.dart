import 'package:demo1/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../api/product_api.dart';

class APIService {
  Future fetchAPIData() async {
    try {
      var response = await http.get(Uri.parse(productAPI));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
