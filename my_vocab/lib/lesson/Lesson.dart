//@dart=2.9
class Lesson {
  int id;
  String name;
  String apiVocabs;

  Lesson(this.id, this.name, this.apiVocabs);

  factory Lesson.fromJson(Map<String, dynamic> map) {
    return Lesson(map["id"], map["name"], map["apiVocabs"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": '"' + this.id.toString() + '"',
      "name": '"' + this.name.toString() + '"',
      "apiVocabs": '"' + this.apiVocabs.toString() + '"'
    };
  }
}
