// @dart=2.9
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/consts/Consts.dart';
import 'package:my_vocab/vocab/Vocab.dart';
import 'package:scoped_model/scoped_model.dart';
//ignore: must_be_immutable
class VocabCard extends StatelessWidget{
  final Vocab vocab;
  CardStatus cardStatus = CardStatus();
  AudioPlayer player = AudioPlayer(
      mode: PlayerMode.MEDIA_PLAYER
  );

  AnimationController controller;
  Animation<double> animation;


  VocabCard({this.vocab, this.controller, this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: GestureDetector(
        child:  Card(
            child: Row(
              children: [
                ScopedModel<CardStatus>(
                    model: cardStatus,
                    child: ScopedModelDescendant<CardStatus>(
                      builder: (context, child, model) {
                        return Expanded(
                            child: MyAnimWidget(
                              child: cardStatus.isFlickThrough ? afterFlick() : beforeFlick(),
                              animation: animation,
                            )
                        );
                      },
                    )
                )
              ],
            )
        ),
        onTap: () {
          cardStatus.changeStatus(!cardStatus.isFlickThrough);
          controller.reset();
          controller.forward();
        },
      )
    );
  }

  Widget beforeFlick() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
      child: Column(
          children: [
            Text(this.vocab.vocab_en, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(this.vocab.vocab_ipa, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.cyan)),
            ),
            IconButton(
                onPressed: () async {
                  try {
                    String source = APIUtil.API_URL + ':' + APIUtil.PORT.toString() + APIUtil.API_ROOT_SOUND + '.' + vocab.vocab_sound_url;
                    print('MP3 source ' + source);
                    await player.play(source);
                  } catch (ex) {
                    print(ex);
                  }
                },
                icon: Icon(Icons.volume_up)
            )
          ]
      ),
    );
  }


  Widget afterFlick() {
    return Container(
      color: Color(0xD880DEE7),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
          children: [
              Text(this.vocab.vocab_vi, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple)),
              Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: wordType()
              ),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Explain: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red)),
                        TextSpan(text: this.vocab.vocab_description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87)),
                      ]
                  )
              ),
          ]
      ),
    );
  }

  Widget wordType() {
    return Text(typeToString(), style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: wordTypeColour()));
  }

  Color wordTypeColour(){
    switch(this.vocab.vocab_type) {
      case Consts.TYPE_VERB: return Color(0xFFDE1515);
      case Consts.TYPE_NOUN: return Colors.green;
      case Consts.TYPE_ADVERB: return Color(0xFF821CC1);
      case Consts.TYPE_ADJECTIVE: return Color(0xFFD59F32);
      case Consts.TYPE_PHRASE:
      default: return Color(0xFF414D74);
    }
  }

  String typeToString(){
    switch(this.vocab.vocab_type) {
      case Consts.TYPE_VERB: return 'Verb';
      case Consts.TYPE_NOUN: return 'Noun';
      case Consts.TYPE_ADVERB: return 'Adverb';
      case Consts.TYPE_ADJECTIVE: return 'Adjective';
      case Consts.TYPE_PHRASE:
      default: return 'Phrase';
    }
  }
}

class CardStatus extends Model{
  bool isFlickThrough = false;

  void changeStatus(bool isFlickThrough) {
    this.isFlickThrough = isFlickThrough;
    print('changeStatus' + isFlickThrough.toString());
    notifyListeners();
  }
}
//ignore: must_be_immutable
class MyAnimWidget extends StatelessWidget {
  Animation animation;
  Widget child;

  MyAnimWidget({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(
            child: Transform(
              child: child,
              transform: Matrix4.rotationY(animation.value * 2 * 3.14),
            ),
          );
        },
    );
  }
}