// @dart=2.9
class Vocab {
  int id;
  int lesson;
  int type;
  String en;
  String ipa;
  String vi;
  String description;
  String urlPronunciation;

  Vocab(this.id, this.lesson, this.type, this.en, this.ipa, this.vi,
      this.description, this.urlPronunciation);

  factory Vocab.fromJson(Map<String, dynamic> map) {
    return Vocab(map['id'], map['lesson'], map['type'], map['en'], map['ipa'],
        map['vi'], map['description'], map['urlPronunciation']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id.toString(),
      "lesson": this.lesson.toString(),
      "type": this.type.toString(),
      "en": '"' + this.en.toString() + '"',
      "ipa": '"' + this.ipa.toString() + '"',
      "vi": '"' + this.vi.toString() + '"',
      "description": '"' + this.description.toString() + '"',
      "urlPronunciation": '"' + this.urlPronunciation.toString() + '"',
    };
  }
}
