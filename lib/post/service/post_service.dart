import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostService {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse("https://openmynetwork.com/wp-json/api/v1/posts"));

      if (response.statusCode == 200) {
        final items = jsonDecode(response.body) as List<dynamic>;
        return items.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw 'Server Error';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }
}
