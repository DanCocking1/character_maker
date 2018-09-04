import 'package:character_maker/items/equipped.dart';
import 'package:character_maker/items/items.dart';
import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/character.dart';
import 'package:character_maker/models/feats.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:character_maker/ui/lien.dart';
import 'package:flutter/material.dart';
class Page3 extends StatefulWidget {
  final Character _hero;
  final BaseAuth auth;
  Page3(this._hero, this.auth);
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              const Color(0xFFFFD700),
              const Color(0xFFFF4500)
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
                  child: Text("Character",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                        fontSize: 19.2
                    ),),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        color: Colors.white30,
                        child: ListTile(
                          title: Text("${widget._hero.name} ${widget._hero.surname}"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text("${widget._hero.name[0]}"+"${widget._hero.surname[0]}"),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    CharacterFacts("Age", "${widget._hero.age.toString()}"),
                    CharacterFacts("Race", "Human")
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharacterFacts("Gender", "${widget._hero.gender}"),
                    CharacterFacts("Faunuas", "${widget._hero.faunusType}")
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharacterFacts("Citizenship", "${widget._hero.citizenship}"),
                    CharacterFacts("Occupation", "${widget._hero.occupation}"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharacterFacts("History", "${widget._hero.background}"),
                    CharacterFacts("Campaign", "None")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Weapon",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 19.4,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,

                    ),
                    textAlign: TextAlign.center,

                  ),
                ),
                Row(
                  children: <Widget>[
                    WeaponFacts("${widget._hero.weapon.weaponType}"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Equipment",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 19.4,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,

                    ),),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                          color: Color.fromRGBO(184, 134, 11, 1.0),
                          child: ListTile(
                            onTap: () {
                              _goToWallet();
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade700,
                              child: Text('L'),
                            ),
                            title: Text('Lien'),
                            subtitle: Text('${widget._hero.lien.toString()}'),
                          )

                      ),
                    ),
                    Expanded(
                      child: Card(
                          color: Color.fromRGBO(184, 134, 11, 1.0),
                          child: ListTile(
                            onTap: () {
                              _getEquipped();
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade700,
                              child: Text('L'),
                            ),
                            title: Text('Equipment'),
                            subtitle: Text('To Equipped'),
                          )

                      ),

                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                          color: Color.fromRGBO(184, 134, 11, 1.0),
                          child: ListTile(
                            onTap: () {
                              _getItems(widget._hero.items);
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade700,
                              child: Text('L'),
                            ),
                            title: Text('Items ${widget._hero.items.length.toString()}'),
                          )

                      ),
                    ),
                    Expanded(
                      child: Card(
                          color: Color.fromRGBO(184, 134, 11, 1.0),
                          child: ListTile(
                            onTap: () => ("Show Equipped"),
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade700,
                              child: Text('L'),
                            ),
                            title: Text('Feats'),
                            subtitle: Text(_getFeats()),

                          )

                      ),

                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
  _goToWallet() async{
    int _changeWallet = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => LienChange(widget._hero.lien)));
    if (_changeWallet!=null && _changeWallet!=widget._hero.lien){
      setState(() {
        widget._hero.lien = _changeWallet;
      });
    }
  }
  String _getFeats(){
    String featsToPrint = '';
    for(Feats feats in widget._hero.feats){
      featsToPrint = featsToPrint + ' ' + feats.name;

    }return featsToPrint;
  }
  _getItems(List<RemnantItem> characterList) async{
    debugPrint(characterList.length.toString());
    for (RemnantItem items in characterList){
      debugPrint(items.name);
    }
    List<RemnantItem> _alpha = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Items(characterList, widget.auth)));
    if(_alpha!=characterList && _alpha!=null){
      setState(() {
        widget._hero.items = _alpha;
      });

    }
  }
  _getEquipped() async{
    EquippedItems _beta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EquippedList(widget._hero, widget.auth)));
  }
}
class CharacterFacts extends StatelessWidget {
  final String _text;
  final String _name;
  CharacterFacts(this._text, this._name);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: Color.fromRGBO(184, 134, 11, 1.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Text(_name[0] + _name[1]),
            ),
            title: Text(_text),
            subtitle: Text(_name),
          )
      ),
    );
  }
}
class WeaponFacts extends StatelessWidget {
  final String _text;
  WeaponFacts(this._text);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: Color.fromRGBO(184, 134, 11, 1.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red.shade900,
              child: Text(_text[0]),
            ),
            title: Text(_text),
          )
      ),
    );
  }
}
