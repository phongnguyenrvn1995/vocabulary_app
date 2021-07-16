// @dart=2.9
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/Vocab.dart';
import 'package:my_vocab/VocabAnimContainFul.dart';

class VocabListLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VocabListLoaderState();
  }
}


class VocabListLoaderState extends State<VocabListLoader> {

  VocabListLoaderState();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder<List<Vocab>>(
        future: fetch(),
        builder: (context, snapshot) {
          if(snapshot.hasError){ // error
            Fluttertoast.showToast(
                msg: 'Request Error!!!',
            );
            return ListView(
              children: [
                Center(
                )
              ],
            );
          } else if(snapshot.hasData) { // success
            print(snapshot.data.length);
            return normalList(snapshot.data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      onRefresh: () {
        return refresh();

      },
    );
  }

  Future<String> refresh() async{
    setState(() {

    });
    return '';
  }

  Future<List<Vocab>> fetch() async{
    String js = await APIUtil.getVocabsJson();
    List<Vocab> vocabs = parse(js);
    print(vocabs);
    return vocabs;
  }

  List<Vocab> parse(String js) {
    try {
      final parsed = json.decode(js).cast<Map<String, dynamic>>();
      List vocabs =  parsed.map((vocab) {
        return Vocab.fromJson(vocab);
      }).toList();
      print('done');
      return vocabs.cast();
    } catch(ex) {
      print('Error ' + ex.toString());
    }
    return [];
  }

  Widget normalList(List<Vocab> vocabs) {
    return Center(
      child: ListView.builder(
        itemCount: vocabs.length,
        itemBuilder: (context, index) {
          return VocabAnimContainFul(vocab: vocabs[index],);
        },
      ),
    );
  }
}