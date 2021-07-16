// @dart=2.9
import 'package:http/http.dart' as http;

class APIUtil {
  static final String API_VOCABS = "http://192.168.0.101:8000/vocabs.json";

  static Future<String> getVocabsJson() async {
    http.Response response = await http.get(Uri.parse(API_VOCABS));
    if (response.statusCode == 200) {
      return response.body;
    }
    return '[]';
  }
}
