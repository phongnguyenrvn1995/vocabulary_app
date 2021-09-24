// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:my_vocab/vocab/Vocab.dart';
import 'VocabAnimContainState.dart';
//ignore: must_be_immutable
class VocabAnimContainFul extends StatefulWidget {
  Vocab vocab;

  VocabAnimContainFul({this.vocab});

  @override
  VocabAnimContainState createState() {
    return VocabAnimContainState(vocab: vocab);
  }
}