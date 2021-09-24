//@dart=2.9
class Lesson {
  // ignore: non_constant_identifier_names
  int lesson_id;
  // ignore: non_constant_identifier_names
  int lesson_course;
  // ignore: non_constant_identifier_names
  String lesson_name;
  // ignore: non_constant_identifier_names
  int lesson_status;


  Lesson(this.lesson_id, this.lesson_course, this.lesson_name, this.lesson_status);

  factory Lesson.fromJson(Map<String, dynamic> map) {
    return Lesson(
        map['lesson_id'],
        map['lesson_course'],
        map['lesson_name'],
        map['lesson_status']
    );
  }
}
