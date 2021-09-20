// @dart=2.9
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_vocab/consts/Consts.dart';

class APIUtil {
  static final String API_URL = "http://18.224.182.129";
  static final int PORT = 8080;
  static final String API_ROOT_SOUND = "/VocabManager/";
  static final String API_LESSONS = "/VocabRestApi/vocab_api/lesson/get_filter?statusID=" + Consts.STATUS_ACTIVE.toString() + "&courseID=";
  static final String API_COURSES = "/VocabRestApi/vocab_api/course/gets";
  static final String API_VOCABS = "/VocabRestApi/vocab_api/vocab/gets_by_lesson/";

  static Future<String> getVocabsJson(int lessonID) async {
    String api = API_URL + ':' + PORT.toString() + API_VOCABS + lessonID.toString();
    print(api);
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    }
    return '[]';
  }

  static Future<String> getLessons(int courseID) async {
    String api = API_URL + ':' + PORT.toString() + API_LESSONS + courseID.toString();
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    }
    return '[]';
  }

  static Future<String> getCourses() async {
    String api = API_URL + ':' + PORT.toString() + API_COURSES;
    print(api);
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    }
    return '[]';
  }
}
