import 'package:character_maker/items/change_equipped.dart';

import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/character.dart';
import 'package:flutter/material.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class EquippedList extends StatefulWidget {
  final Character _equippedItems;
  final BaseAuth auth;
  EquippedList(this._equippedItems, this.auth);
  @override
  _EquippedListState createState() => _EquippedListState();
}

class _EquippedListState extends State<EquippedList> {
  EquippedItems currentEquip;
  Character finishedCharacter;
  @override
  void initState() {
    super.initState();
    currentEquip = widget._equippedItems.equippedItems;
    finishedCharacter = widget._equippedItems;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Characters Equipped Items') ,
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.grey.shade700,
            Colors.grey.shade900,
          ],
          stops: [0.0,1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
        ),
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.body);
                },


                title: Text('Body'),
                subtitle: Text(widget._equippedItems.equippedItems.body.name + '\n'+ currentEquip.body.description),
              ),
            ),
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.back);
                },
                title: Text('Back'),
                subtitle: Text(currentEquip.back.name + '\n'+ currentEquip.back.description),
              ),
            ),
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.nature),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.neck);
                },
                title: Text('Neck'),
                subtitle: Text(currentEquip.neck.name + '\n'+ currentEquip.neck.description),
              ),
            ),
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.arrow_downward),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.shoes);
                },
                title: Text('Shoes'),
                subtitle: Text(currentEquip.shoes.name + '\n'+ currentEquip.shoes.description),
              ),
            ),
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.arrow_back),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.leftHand);
                },
                title: Text('Left Hand'),
                subtitle: Text(currentEquip.leftHand.name + '\n'+ currentEquip.leftHand.description),
              ),
            ),
            Card(
              color: Colors.white24,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.arrow_forward),
                ),
                onTap: (){
                  debugPrint('Changing Screen....');
                  _goToChangeEquipment(widget._equippedItems.equippedItems, currentEquip.rightHand);
                },
                title: Text('Right Hand'),
                subtitle: Text(currentEquip.rightHand.name + '\n'+ currentEquip.rightHand.description),
              ),
            ),

          ],
        ),
      ),
    );
  }
  _goToChangeEquipment(EquippedItems items, RemnantItem equipped) async{
    Character _alpha = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChangeEquipped(widget._equippedItems, equipped.location)));
    if(_alpha!=null && _alpha!=widget._equippedItems){
      setState(() {
        finishedCharacter = _alpha;

      });
      for (RemnantItem _y in finishedCharacter.items){
        debugPrint(_y.name);
      }
    }
  }
}
