// @dart=2.9
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_vocab/consts/Consts.dart';

class APIUtil {
  // ignore: non_constant_identifier_names
  static final String API_URL = "http://18.224.182.129";
  // ignore: non_constant_identifier_names
  static final int PORT = 8080;
  // ignore: non_constant_identifier_names
  static final String API_ROOT_SOUND = "/VocabManager/";
  // ignore: non_constant_identifier_names
  static final String API_LESSONS = "/VocabRestApi/vocab_api/lesson/get_filter?statusID=" + Consts.STATUS_ACTIVE.toString() + "&courseID=";
  // ignore: non_constant_identifier_names
  static final String API_COURSES = "/VocabRestApi/vocab_api/course/get_by_status/" + Consts.STATUS_ACTIVE.toString();
  // ignore: non_constant_identifier_names
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
