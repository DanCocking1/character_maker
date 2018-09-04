import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/character.dart';
import 'package:character_maker/ui/page_1.dart';
import 'package:character_maker/ui/page_2.dart';
import 'package:character_maker/ui/page_3.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CharacterInfo extends StatefulWidget {
  final Character inform;
  final BaseAuth auth;
  CharacterInfo(this.inform, this.auth);
  @override
  _CharacterInfoState createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  Character workingChar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workingChar = widget.inform;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd:  Colors.blueGrey.shade900,
        title: Text('Character Sheet'),


      ),
      body: PageView(
        children: <Widget>[
          new Page1(workingChar, widget.auth),
          new Page2(workingChar, widget.auth),
          new Page3(workingChar, widget.auth)
        ],
      ),
    );
  }
}
