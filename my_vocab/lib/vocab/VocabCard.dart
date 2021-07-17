// @dart=2.9
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/vocab/Vocab.dart';
import 'package:scoped_model/scoped_model.dart';

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
            Text(this.vocab.en, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(this.vocab.ipa, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.cyan)),
            ),
            IconButton(
                onPressed: () async {
                  try {
                    String source = APIUtil.API_URL + ':' + APIUtil.PORT.toString() + '/' + vocab.urlPronunciation;
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
              Text(this.vocab.vi, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple)),
              Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: wordType()
              ),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Explain: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red)),
                        TextSpan(text: this.vocab.description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87)),
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
    switch(this.vocab.type) {
      case 0: return Color(0xFFD55F5F);
      case 1: return Colors.green;
      case 2: return Color(0xFF821CC1);
      case 3: return Color(0xFFD56B32);
      default: return Color(0xFF414D74);
    }
  }

  String typeToString(){
    switch(this.vocab.type) {
      case 0: return 'Verb';
      case 1: return 'Noun';
      case 2: return 'Adverb';
      case 3: return 'Adjective';
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