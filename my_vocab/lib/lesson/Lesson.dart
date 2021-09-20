//@dart=2.9
class Lesson {
  int lesson_id;
  int lesson_course;
  String lesson_name;
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
