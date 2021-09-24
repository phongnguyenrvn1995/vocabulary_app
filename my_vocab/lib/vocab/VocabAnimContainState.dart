// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:my_vocab/vocab/Vocab.dart';

import 'VocabCard.dart';

class VocabAnimContainState<VocabAnimContainFul> extends State with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;
  Vocab vocab;

  VocabAnimContainState({this.vocab});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Center(
      child: VocabCard(
        controller: controller,
        animation: animation,
        vocab: vocab,
      ),
    );
  }
}