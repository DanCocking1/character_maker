import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/character.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final Character _hero;
  final BaseAuth auth;
  Page1(this._hero, this.auth);
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              const Color(0xFFFF0000),
              const Color(0xFF555555)
            ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            )
        ),
        child: new ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(5.00)),
            new Text(
              _hero.name + ' ' + _hero.surname,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 19.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Aura",
                          textAlign: TextAlign.center,),
                        subtitle: Text('Max: ' + _hero.primaryStats.maxAura.toString() + " \n"
                            "Current: ${_hero.primaryStats.currentAura.toString()}\nTemp: ${_hero.primaryStats.tempAura.toString()}", textAlign: TextAlign.center,
                        ),
                        onTap: () => debugPrint("1"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Hit Points", textAlign: TextAlign.center,),
                        subtitle: Text("Max: ${_hero.primaryStats.maxHp.toString()}  \nCurrent: ${_hero.primaryStats.currentHp.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("2"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Armor", textAlign: TextAlign.center,),
                        //TODO Get total armor from equipped pieces
                        subtitle: Text("Base ${_hero.primaryStats.armorRating.toString()}\n Bonus 0\n Total ${_getArmorScore().toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("3"),
                      ),
                    ))
              ],
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Sembelence", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.semblance.name}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("${_hero.semblance.description}"),
                        //TODO Alert Dialog for semblance rules
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Aura", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.aura.name}",textAlign: TextAlign.center,),
                        onTap: () => debugPrint("5"),
                        //TODO Alert Dialog for Aura
                      ),
                    )),
              ],
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            Row(
              children: <Widget>[
                Expanded(
                  child: new Text("${_hero.weapon.name}",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.7,
                      //fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(
                  child: new Text("${_hero.weapon.weaponType}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.7,
                      fontStyle: FontStyle.italic,
                    ),),
                )
              ],
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Attack Speed:", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.weapon.getDamageClassDescriptor(_hero.weapon.damageClass)}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("6"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Hit Bonus:", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.weapon.hitBonus.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("7"),
                      ),

                    )),
              ],
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Damage Class:",
                          textAlign: TextAlign.center,),
                        subtitle: Text("d${_hero.weapon.damageClass}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("8"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Bonus:", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.weapon.damageBonus.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("9"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Range:", textAlign: TextAlign.center,),
                        subtitle: Text("${_hero.weapon.weaponRange}ft", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("10"),
                      ),
                    )),
              ],
            ),
            new Padding(padding: EdgeInsets.all(5.00)),
            new Text("Dust Pouch",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.7,
                fontWeight: FontWeight.bold,
              ),),
            new Padding(padding: EdgeInsets.all(5.00)),
            //TODO Alert Dialog for dust Usage
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Wind",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.greenAccent
                          ),),
                        subtitle: Text("${_hero.dustPouch.wind.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("11"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Fire",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.deepOrange,
                          ),),
                        subtitle: Text("${_hero.dustPouch.fire.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("12"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Lightining",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.yellowAccent
                          ),),
                        subtitle: Text("${_hero.dustPouch.lightning.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("13"),
                      ),
                    )),
                new Expanded(
                    child: new Card(
                      color: Colors.white10,
                      child: new ListTile(
                        title: Text("Water",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueAccent,
                          ),),
                        subtitle: Text("${_hero.dustPouch.water.toString()}", textAlign: TextAlign.center,),
                        onTap: () => debugPrint("14"),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
  int _getArmorScore(){
    int _x = 0;
    _x = _hero.equippedItems.body.armorValue + _hero.equippedItems.back.armorValue +
    _hero.equippedItems.shoes.armorValue + _hero.equippedItems.neck.armorValue +
    _hero.equippedItems.rightHand.armorValue + _hero.equippedItems.leftHand.armorValue;
    _x = _x + _hero.primaryStats.figureBonus(_hero.primaryStats.dex);
    return 10 + _x;
  }

}
