import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/character.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Page2 extends StatefulWidget {
  final Character _hero;
  final BaseAuth auth;
  Page2(this._hero, this.auth);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFF87CEEB)
            ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            )
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Primary Stats for ${widget._hero.name} ${widget._hero.surname}",
                    style: new TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18.2,
                      color: Colors.blue
                    ),),
                ),
                Row(
                  //TODO ADD LEVELING DIALOG/PAGE
                  children: <Widget>[
                    PrimaryStatExp("Character Level", widget._hero.primaryStats.playerLevel),
                    PrimaryStatExp("Experience Points", widget._hero.primaryStats.exp),

                  ],
                ),
                SizedBox(height: 16.0,),
                Row(
                  children: <Widget>[
                    Skills ("Intiative", _figureInt()),
                    //TODO SPEED ADD TO PRIMARY, AND WEAPONS
                    PrimaryStat("Speed", 30)
                  ],

                ),
                Row(
                  children: <Widget>[
                    new PrimaryStat("Str", widget._hero.primaryStats.str),
                    new PrimaryStat("Dex", widget._hero.primaryStats.dex),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new PrimaryStat("Con", widget._hero.primaryStats.con),
                    new PrimaryStat("Chr", widget._hero.primaryStats.chr),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new PrimaryStat("Wis", widget._hero.primaryStats.wis),
                    new PrimaryStat("Int", widget._hero.primaryStats.intel)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Skills",
                    style: TextStyle(
                      fontSize: 16.4,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue
                    ),),
                ),
                Row(
                  children: <Widget>[
                    new Skills("Acrobatics", widget._hero.skills.acrobatics),
                    new Skills("Animal Handling", widget._hero.skills.animalHandling),
                  ],


                ),
                Row(
                  children: <Widget>[
                    Skills("Athletics", widget._hero.skills.athletics),
                    Skills("Aura", widget._hero.skills.auraSkill),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Deception", widget._hero.skills.deception),
                    Skills("Dust", widget._hero.skills.knowledgeDust),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Grimm", widget._hero.skills.grimm),
                    Skills("History", widget._hero.skills.history)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Insight", widget._hero.skills.insight),
                    Skills("Intimidate", widget._hero.skills.intimidation)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Investigate", widget._hero.skills.investigation),
                    Skills("Nature", widget._hero.skills.nature)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Perception", widget._hero.skills.perception),
                    Skills("Perform", widget._hero.skills.performance)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Persuasion", widget._hero.skills.persuasion),
                    Skills("Sleight of Hand", widget._hero.skills.sleightOfHand)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skills("Stealth", widget._hero.skills.stealth),
                    Skills("Survival", widget._hero.skills.survival)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text ("Lifting and Carrying"),
                ),
                Row(
                  children: <Widget>[
                    PrimaryStat("Carrying Capacity", (widget._hero.primaryStats.str * 15)),
                    PrimaryStat("Push, Drag or Lift", (widget._hero.primaryStats.str * 30)),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Saving Throws"),
                ),
                Row(
                  children: <Widget>[
                    SavingThrow("Str", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.str)),
                    SavingThrow("Dex", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.dex)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SavingThrow("Con", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.con)),
                    SavingThrow("Chr", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.chr))
                  ],
                ),
                Row(
                  children: <Widget>[
                    SavingThrow("Int", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.intel)),
                    SavingThrow("Wis", widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.wis))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  int _figureInt(){
    return widget._hero.primaryStats.figureBonus(widget._hero.primaryStats.dex);
  }

}
class Skills extends StatelessWidget {
  final String _text;
  final int _value;

  Skills(this._text, this._value);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.black12,
        child: ListTile(
          onTap: () => rollTheDiceSkills(context, _text, _value),
          title: Text(_text),
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent.shade100,
            child: Text(_value.toString()),
          ),
        ),
      ),
    );
  }
}

class SavingThrow extends StatelessWidget {
  final String _text;
  final int _value;
  SavingThrow(this._text, this._value);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.black12,
        child: ListTile(
          onTap: () => rollTheDiceSkills(context, _text, _value),
          title: Text(_text),
          leading: CircleAvatar(
            backgroundColor: Colors.redAccent.shade700,
            child: Text(_value.toString()),
          ),
        ),
      ),
    );
  }
}


class PrimaryStat extends StatelessWidget {
  final String _text;
  final int _value;

  PrimaryStat(this._text, this._value);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.black12,
        child: ListTile(
          onTap: () => debugPrint(_text),
          title: Text(_text),
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent.shade700,
            child: Text(_value.toString()),
          ),
        ),
      ),
    );
  }
}

class PrimaryStatExp extends StatelessWidget {
  final String _text;
  final int _value;

  PrimaryStatExp(this._text, this._value);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.black12,
        child: ListTile(
          onTap: ()=>debugPrint(_text),
          title: Text(_text),
          leading: CircleAvatar(
            backgroundColor: Colors.indigo.shade700,
            child: Text(_value.toString()),
          ),
        ),
      ),
    );
  }
}


int randomNumberD (int a){
  var rng = new Random.secure();
  int roll = rng.nextInt(a);
  return roll;
}

void rollTheDiceSkills (BuildContext context, String text, int value){
  final int rolled = (randomNumberD(20)+ 1);
  final int rolledAdDisad = (randomNumberD(20)+ 1);
  var alert = new AlertDialog(
    title: Text("Roll a d20 for a  $text skill check"),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Your skill is ${value.toString()}"),
        Text("Your Roll was ${rolled.toString()}"),
        Text("Your Total is ${(value + rolled).toString()}"),
        Text("If you had Advantage your roll is ${(max(rolled, rolledAdDisad) + value).toString()}"),
        Text("If you had disadvanteage your roll is ${(min(rolled, rolledAdDisad)+ value).toString()}")

      ],
    ),
//    actions: <Widget>[
//      FlatButton(
//        color: Colors.blue.shade900,
//        onPressed: (){
//          Navigator.pop(context);
//        },
//        child: Text("Accept"),
//      )
//    ],
  )  ;
  showDialog(context: context,
      builder: (_){
        return alert;
      });
}