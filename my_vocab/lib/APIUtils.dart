// @dart=2.9
import 'package:http/http.dart' as http;

class APIUtil {
  static final String API_URL = "http://18.224.182.129";
  static final int PORT = 8080;
  // static final String API_VOCABS = "vocabs.json";
  static final String API_LESSONS = "lessons.json";
  static final String API_COURSES = "/VocabRestApi/vocab_api/course/gets";

  static Future<String> getVocabsJson(String apiVocabs) async {
    String api = API_URL + ':' + PORT.toString() + '/' + apiVocabs;
    print(api);
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return response.body;
    }
    return '[]';
  }

  static Future<String> getLessons() async {
    String api = API_URL + ':' + PORT.toString() + '/' + API_LESSONS;
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return response.body;
    }
    return '[]';
  }

  static Future<String> getCourses() async {
    String api = API_URL + ':' + PORT.toString() + API_COURSES;
    print(api);
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return response.body;
    }
    return '[]';
  }
}
