// @dart=2.9
class Vocab {
  // ignore: non_constant_identifier_names
  int vocab_id;
  // ignore: non_constant_identifier_names
  int vocab_type;
  // ignore: non_constant_identifier_names
  int vocab_lesson;
  // ignore: non_constant_identifier_names
  String vocab_en;
  // ignore: non_constant_identifier_names
  String vocab_ipa;
  // ignore: non_constant_identifier_names
  String vocab_vi;
  // ignore: non_constant_identifier_names
  String vocab_description;
  // ignore: non_constant_identifier_names
  String vocab_sound_url;


  Vocab(
      this.vocab_id,
      this.vocab_type,
      this.vocab_lesson,
      this.vocab_en,
      this.vocab_ipa,
      this.vocab_vi,
      this.vocab_description,
      this.vocab_sound_url);

  factory Vocab.fromJson(Map<String, dynamic> map) {
    return Vocab(
        map['vocab_id'],
        map['vocab_type'],
        map['vocab_lesson'],
        map['vocab_en'],
        map['vocab_ipa'],
        map['vocab_vi'],
        map['vocab_description'],
        map['vocab_sound_url']
    );
  }
}
