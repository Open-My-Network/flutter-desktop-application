import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_my_network_app/post/model/category_model.dart';


class CategoryService {
  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final response = await http
          .get(Uri.parse("https://openmynetwork.com/wp-json/api/v1/categories"));

      if (response.statusCode == 200) {
        final items = jsonDecode(response.body) as List<dynamic>;
        return items.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw 'Server Error';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }
}
