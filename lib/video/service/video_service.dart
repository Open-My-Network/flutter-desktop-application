import 'package:http/http.dart' as http;

class VideoService {
  Future<void> fetchVideos() async {
    try {
      final response = await http
          .get(Uri.parse("https://openmynetwork.com/wp-json/api/v1/posts"));

      if (response.statusCode == 200) {
        //final items = jsonDecode(response.body) as List<dynamic>;
        // return items.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw 'Server Error';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }
}
