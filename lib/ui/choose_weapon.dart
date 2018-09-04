import 'package:character_maker/models/weapon.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChooseWeapon extends StatefulWidget {
 
  @override
  _ChooseWeaponState createState() => _ChooseWeaponState();
}

class _ChooseWeaponState extends State<ChooseWeapon> {
  List<Weapon> choices= new List();
  TextEditingController _name = new TextEditingController();
  int _selected  = 0;
  @override
  void initState() {
    super.initState();
    choices = availableWeapons();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Choose Wisely'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _name,
            decoration: InputDecoration(
              labelText: 'Name Your Weapon',
              icon: Icon(Icons.assignment)
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: choices.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Colors.white24,
                  child: RadioListTile(
                    title: Text(choices[index].weaponType),
                    subtitle: Text("Attack Speed: " + choices[index].attackSpeed +
                    "Damage Die: d" + choices[index].damageClass.toString() + "\nAttack Range: "
                        + choices[index].weaponRange.toString() + 'ft' +
                    'To hit bonus: ' + choices[index].hitBonus.toString() +
                    '\n' + choices[index].notes),
                    value: index,
                    groupValue: _selected,
                    onChanged: _handleRadioItemSelected,
                  ),
                )),
          ),
          FlatButton(
            color: Colors.green,
            child: Text('Confirm'),
            onPressed:(){
              if(_name.text!=null && _name.text.isNotEmpty
              && _name.text!='Please Enter a Weapon Name'){
                setState(() {
                  choices[_selected].name = _name.text;
                });
                Navigator.pop(context, choices[_selected]);
              }else{
                setState(() {
                  _name.text = 'Please Enter a Weapon Name';
                });
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Enter a name')));
              }

              debugPrint('Confirmed ${choices[_selected].weaponType}');
            },
          )
        ],
      ),
    );
  }
  _handleRadioItemSelected(int value){
    setState(() {
      _selected = value;
    });

  }
}
