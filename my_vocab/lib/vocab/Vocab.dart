// @dart=2.9
class Vocab {
  int vocab_id;
  int vocab_type;
  int vocab_lesson;
  String vocab_en;
  String vocab_ipa;
  String vocab_vi;
  String vocab_description;
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
