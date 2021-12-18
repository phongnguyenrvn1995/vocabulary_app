// @dart=2.9

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/vocab/Vocab.dart';

import '../APIUtils.dart';
import 'QuestionBoardOnSelectedListener.dart';

//ignore: must_be_immutable
class QuestionBoardVE extends StatelessWidget {
  final List<Vocab> sessionVocabs;
  final QuestionBoardOnSelectedListener listener;
  final Vocab goal;
  AudioPlayer player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  QuestionBoardVE({this.sessionVocabs, this.goal, this.listener});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [loadQuestion(), loadAnswers()],
    ));
  }

  Widget loadQuestion() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 140,
              padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
              child: Column(children: [
                Text(
                  this.goal.vocab_vi,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ]),
            ))
      ],
    );
  }

  Widget loadAnswers() {
    List<Widget> children = [];
    for (int i = 0; i < sessionVocabs.length; i++) {
      children.add(loadAnswer(sessionVocabs[i]));
    }

    return Row(children: [
      Expanded(child: Column(children: children)),
    ]);
  }

  Widget loadAnswer(Vocab vocab) {
    TextButton textButton = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 207, 239, 212)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.cyan)
              ))),
      child: Text(
        vocab.vocab_en,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: () async {
        await AudioCache().play(vocab.vocab_id == this.goal.vocab_id ? "sound/sound_correct.mp3" : "sound/sound_incorrect.mp3");

        if (listener != null) {
          listener.onSelected(vocab.vocab_id == this.goal.vocab_id);
        }
      },
    );

    return Row(children: [
      Expanded(
          child: Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: textButton
      )),
    ]);
  }
}
