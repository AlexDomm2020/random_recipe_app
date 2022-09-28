import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = "https://api.spoonacular.com/recipes/random";

  static const apiKey = "?apiKey=256306b4e12f48488e43d922dbb9a429";

  static Future<http.Response> getRequest() async {
    http.Response response;
    final url = Uri.parse("$baseUrl$apiKey");
    print(url);
    try {
      response = await http.get(url);
    } catch (e) {
      throw e;
    }
    return response;
  }
}
