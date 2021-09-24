//@dart=2.9
class Course {
  // ignore: non_constant_identifier_names
  int course_id;
  // ignore: non_constant_identifier_names
  String course_name;
  // ignore: non_constant_identifier_names
  String course_description;
  // ignore: non_constant_identifier_names
  String course_date_creat;
  // ignore: non_constant_identifier_names
  int course_status;

  Course(this.course_id, this.course_name, this.course_description,
      this.course_date_creat, this.course_status);

  factory Course.fromJson(Map<String, dynamic> map) {
    return Course(
        map["course_id"],
        map["course_name"],
        map["course_description"],
        map["course_date_creat"],
        map["course_status"]
    );
  }
}