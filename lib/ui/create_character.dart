
import 'package:character_maker/models/feats.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:character_maker/models/weapon.dart';
import 'package:character_maker/ui/choose_citizenship.dart';
import 'package:character_maker/ui/choose_feats.dart';
import 'package:character_maker/ui/choose_race.dart';
import 'package:character_maker/ui/choose_semblance.dart';
import 'package:character_maker/ui/choose_aura.dart';
import 'package:character_maker/ui/choose_skills.dart';
import 'package:character_maker/ui/choose_weapon.dart';
import 'package:character_maker/ui/primary_stat_set.dart';
import 'package:character_maker/ui/starting_equipment.dart';
import 'package:character_maker/ui/starting_items.dart';
import 'package:flutter/material.dart';
import 'package:character_maker/models/character.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CreateCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
          backgroundColorEnd: Colors.blueGrey.shade900,
          title: Text('Create New Character')),
      body: CreateCharacterMaker(

      ),
    );
  }
}
class CreateCharacterMaker extends StatefulWidget {
  @override
  _CreateCharacterMakerState createState() => _CreateCharacterMakerState();
}

class _CreateCharacterMakerState extends State<CreateCharacterMaker> {
  Color pickerColor = new Color(0xFFFFFF00);
  Color currentColor = new Color (0xFF00FFFF);
  bool weaponChosenFirst =false;
  bool raceBool = true;
  bool  kingdomBool = false;
  bool weaponBool = false;
  bool itemsBool = false;
  bool auraBool = false;
  bool semblanceBool = false;
  bool equppiedBool = false;
  bool primaryBool = false;
  bool  skillsBool = false;
  bool featsBool = false;
  bool allSelected = false;
  Weapon weapon = new Weapon('Choose', '  ', 0, 1, 1, 1, 'choose a weapon');
  Semblance semblance;
  String semblanceChosen = 'Semblance Not yet Chosen';
  String choose = 'Choose a Weapon';
  String typeWeapon = 'Not Chosen';
  String itemsChosen = 'Choose Starting Items';
  String choosePrimaries = 'Choose your primary Stats';
  String chooseFeats = 'Choose your starting feat';
  String chooseCitizenship = 'Choose a Kindom you are from';
  String raceChoice = 'Choose Your Character\'s race';
  int _lien = 0;
  Aura aura;
  String auraChosen = 'Not Yet Chosen';
  List <RemnantItem> items = new List<RemnantItem>();
  EquippedItems equippedItems;
  String equip = 'Choose Starting wearables';
  DustPouch dustPouch = new DustPouch(5,5,5,5,20);
  PrimaryStats primaryStats;
  List<Feats>feats = new List<Feats>();
  Skills skills;
  String skillsHaveBeenSelected = 'Please Choose Skills';
  bool itemsHaveSelect = false;
  TextEditingController  _faunus = new TextEditingController(text: 'Not a faunus');
  TextEditingController _name = new TextEditingController();
  TextEditingController _surname = new TextEditingController(text: ' ');
  TextEditingController _background = new TextEditingController(text: ' ');
  TextEditingController _occupation = new TextEditingController(text:  ' ');
  Color _primaryColor = new Color(0xFF000000);
  Color _secondaryColor = new Color (0xFFFFFFFF);
  TextEditingController _ageString = new TextEditingController();
  List<String> _race = ['Human', 'Faunus', 'Robot'];
  int _raceInt = 0;
  List<String>  _gender = ['Female', 'Male', 'Other'];
  int _genderInt = 0;
  List<String>  _citizenship = ['Atlas', 'Vale', 'Mistrail', 'Vacuo', 'Menagerie', 'White Fang', 'Independent', 'Rogue'];
  int _citizenshipInt = 0;
  List<RemnantItem> starters = new List();

  @override
  void initState() {
    super.initState();
    weapon.name = ' ';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:
        [
          Colors.red,
          Colors.black87,
        ],
        begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0]
        )
      ),
      child: ListView(
        children: <Widget>[
          TextField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                labelText: 'First or Personal name'
              ),

            ),
          TextField(
              controller: _surname,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Enter Last or Family Name'
              ),
            ),
          TextField(
              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
              controller: _ageString,
              decoration: InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  labelText: 'Age of Huntsman, Hunter, or Huntress in whole number'
              ),
            ),
          TextField(
              controller: _background,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(Icons.info),
                  labelText: "Enter Character's Background e.g. Heiress"
              ),
            ),
        TextField(
              controller: _occupation,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(Icons.assignment),
                  labelText: 'Occupation'
              ),
            ),
         TextField(
              controller: _faunus,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(Icons.group),
                  labelText: 'Faunus Type'
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text('Primary Color',
            textAlign: TextAlign.center,),
          ),
          SizedBox(height: 1.0,),
          ListTile(
            onTap: (){
              _myPrimaryChangeColor(context);
            },
            title: SizedBox(
              height: 36.0,
              width: 36.0,
            child: Card(
              color: _primaryColor,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text('Secondary Color',
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 1.0,),
          ListTile(
            onTap: (){
              _mySecondaryChangeColor(context);
            },
            title: SizedBox(
              height: 36.0,
              width: 36.0,
              child: Card(
                color: _secondaryColor,
              ),),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white12,
            child: ListTile(
              enabled: raceBool,
              onTap: _handleRaceChoice,
              title: Text(raceChoice),
              leading: CircleAvatar(
                backgroundColor: _primaryColor,
                foregroundColor: _secondaryColor,
                child: Text(raceChoice[0]),
              ),
              subtitle: Text('Race'),
            ),
          ),

          SizedBox(height: 1.0,),
          Container(
            color: Colors.white30,
            child: Column(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Gender'),
                ),
                RadioListTile(
                    title: Text(_gender[0].toString()),
                    value: 0,
                    groupValue: _genderInt,
                    onChanged: _handleGenderRadioValueChanged),
                RadioListTile(
                    title: Text(_gender[1].toString()),
                    value: 1,
                    groupValue: _genderInt,
                    onChanged: _handleGenderRadioValueChanged),
              ],
            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _primaryColor,
                child: Text(chooseCitizenship[0]),
                foregroundColor: _secondaryColor,

              ),
              enabled: kingdomBool,
              onTap: _handleCitizenship,
              title: Text(chooseCitizenship),
              subtitle: Text('Kingdom Citizenship'),
            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white24,
            child: ListTile(
              enabled: weaponBool,
              onTap:(){
                _handleWeapongoTo(context, weapon);
                debugPrint('weapon');
              },
              leading: CircleAvatar(
                  backgroundColor: _secondaryColor,
                  child: Text(choose[0]),
                foregroundColor: _primaryColor,
              ),
              title: Text(choose),
              subtitle: Text(typeWeapon),
            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _primaryColor,
                foregroundColor: _secondaryColor,
                child: Text(itemsChosen[0]),
              ),
              title: Text(itemsChosen),
              subtitle: Text("Starting Lien: " + _lien.toString()),
              enabled: itemsBool,
              onTap: (){
                _handleStartingItems(context);
                debugPrint('handling items');
    }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white24,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _secondaryColor,
                  foregroundColor: _primaryColor,
                  child: Text(auraChosen[0]),
                ),
                title: Text('Aura'),
                subtitle: Text(auraChosen),
                enabled: auraBool,
                onTap: (){
                  _handleAuraChoice(context);
                  debugPrint('handling Auras');
                }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white12,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _primaryColor,
                  foregroundColor: _secondaryColor,
                  child: Text(semblanceChosen[0]),
                ),
                title: Text('Semblance'),
                subtitle: Text(semblanceChosen),
                enabled: semblanceBool,

                onTap: (){
                  _handleSemblanceChoice(context);
                  debugPrint('handling Semblance');
                }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white24,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _secondaryColor,
                  foregroundColor: _primaryColor,
                  child: Text(equip[0]),
                ),
                title: Text('Equipped Items'),
                subtitle: Text(equip),
                enabled: equppiedBool,

                onTap: (){
                  _handleItemEquip(context);
                  debugPrint('handling Starter equipment');
                }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white12,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _primaryColor,
                  foregroundColor: _secondaryColor,
                  child: Text(choosePrimaries[0]),
                ),
                title: Text('Primary Stats'),
                subtitle: Text(choosePrimaries),
                enabled: primaryBool,
                onTap: (){
                  _handlePrimaryStatsCreation(context);
                  debugPrint('handling Primaries');
                }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white24,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _secondaryColor,
                  foregroundColor: _primaryColor,
                  child: Text(choosePrimaries[0]),
                ),
                title: Text('Skills'),
                subtitle: Text(skillsHaveBeenSelected),
                enabled: skillsBool,
                onTap: (){
                  _handleSkillsSelection(context);
                  debugPrint('handling Skills');
                }

            ),
          ),
          SizedBox(height: 1.0,),
          Container(
            color: Colors.white24,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _primaryColor,
                  foregroundColor: _secondaryColor,
                  child: Text(chooseFeats[0]),
                ),
                title: Text('Feats'),
                subtitle: Text(chooseFeats),
                enabled: featsBool,
                onTap: (){
                  _handleFeatsSelection(context);
                  debugPrint('handling Feats');
                }

            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: Colors.redAccent.shade700,
                    child: Text('Save'),
                    onPressed: (){
                      setState(() {
                        if(_name.text!=null && _name.text.isNotEmpty
                            && _surname.text!=null && _surname.text.isNotEmpty
                            && !(int.parse(_ageString.text)).isNaN &&
                          weapon.name != ' ' && allSelected){

                          Character _created = new Character(
                              _name.text,
                              _surname.text,
                              _primaryColor.value,
                              _secondaryColor.value,
                              int.parse(_ageString.text),
                              _race[_raceInt],
                              _gender[_genderInt],
                              _faunus.text,
                              _citizenship[_citizenshipInt],
                              _occupation.text,
                              _background.text);
                          setState(() {
                            _created.weapon = weapon;
                            _created.dustPouch = dustPouch;
                            debugPrint(dustPouch.toJson().toString());
                            _created.semblance =semblance;
                            _created.primaryStats =primaryStats;
                            debugPrint(primaryStats.toJson().toString());
                            _created.aura = aura;
                            _created.skills = skills;
                            debugPrint(skills.toJson().toString());
                            _created.items = items;
                            for(int i = 0; i<items.length; i++){
                              debugPrint(items[i].toJson().toString());
                            }
                            _created.feats.add(feats[0]);
                            for (int y = 0; y<feats.length; y++){
                              debugPrint('\n' + feats[y].toJson().toString() + '\n');
                            }
                            _created.lien = _lien;
                            _created.equippedItems =equippedItems;
                          });

                          Navigator.pop(context, _created);
                        }


                        else{
//                          Scaffold.of(context).showSnackBar(
//                              SnackBar(content: Text('Please enter a first name'))
//                          );
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(width: 16.0,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: Colors.greenAccent.shade700,
                    child: Text('Cancel'),
                    onPressed: (){
                      Navigator.pop(context);
                      debugPrint('cancel');
                    },
                  ),
                ),
              )

            ],
          ),

        ],
      ),
    );
  }
 _myPrimaryChangeColor(BuildContext context){

    showDialog(
        context: context,
    builder: (BuildContext context){
          return new AlertDialog(
            title: Text('Pick a Color'),
            content: new SingleChildScrollView(
              child: new ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
                colorPickerWidth: 1000.0,
                pickerAreaHeightPercent: 0.7,
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: (){
                    setState(() {
                      _primaryColor = pickerColor;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Choose Color'))
            ],
          );
    });
  }
  changeColor(Color color){
    setState(() {
      pickerColor = color;
    });
  }
  _mySecondaryChangeColor(BuildContext context){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return new AlertDialog(
            title: Text('Pick a Color'),
            content: new SingleChildScrollView(
              child: new ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
                colorPickerWidth: 1000.0,
                pickerAreaHeightPercent: 0.7,
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: (){
                    setState(() {
                      _secondaryColor = pickerColor;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Choose Color'))
            ],
          );
        });
  }

  void _handleGenderRadioValueChanged(int value) {
    setState(() {
      _genderInt = value;
    });
    debugPrint(_gender[_genderInt].toString());

  }
  _handleRaceChoice() async{
    int _rc = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseRace()));
    if (_rc!=null){
      setState(() {
        raceBool = false;
        kingdomBool = true;
        _raceInt = _rc;
        raceChoice = _race[_raceInt];
      });
    }


  }

  void _handleCitizenship() async {
    int _hc = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseCitizenship()));
    if (_hc!=null){
      setState(() {
        kingdomBool = false;
        weaponBool = true;
        _citizenshipInt = _hc;
        chooseCitizenship = _citizenship[_citizenshipInt];
      });
    }

    debugPrint(_citizenship[_citizenshipInt].toString());

  }
  _handleWeapongoTo(BuildContext context, Weapon a) async{
    Weapon beta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseWeapon()));
    if(beta!=null && beta.name.isNotEmpty){
      setState(() {
        weaponBool = false;
        itemsBool = true;
        weapon = beta;
        if(beta.weaponType == 'Wand'){
         dustPouch.maxDust = dustPouch.maxDust + 10;
        }

        choose = beta.name;
        if(beta.weaponType!=null && beta.weaponType.isNotEmpty)
        typeWeapon = beta.weaponType;
        else
          typeWeapon = 'OOPS!';
      });
      Scaffold.of(context).showSnackBar(SnackBar(content:
      Text('Selected ${weapon.name}')));
    }
  }
  _handleStartingItems(BuildContext context)async{
    StarterItems _alpha = await Navigator.push(
        context,
    MaterialPageRoute(builder: (context) => StartingItems()));
    if(_alpha!=null && _alpha.starters.length!=0){
      setState(() {
        itemsBool = false;
        auraBool = true;
        items = _alpha.starters;
        _lien = _alpha.lien;
        itemsChosen = 'You choose ${_alpha.starters.length.toString()} items';
        itemsHaveSelect = true;
      });


    }
    else{
     debugPrint('OOPS not Chosen');
    }
  }
  _handleAuraChoice(BuildContext context)async {
    Aura beta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseAura()));

    if (beta != null && beta.name.isNotEmpty) {
      setState(() {
        auraBool = false;
        semblanceBool = true;
        auraChosen = beta.name;
        if (beta.name == 'Focus'&& weaponChosenFirst == false){
          dustPouch.wind = dustPouch.wind + 5;
          dustPouch.water = dustPouch.water + 5;
          dustPouch.fire =dustPouch.fire +5;
          dustPouch.lightning+=5;
          dustPouch.maxDust+=20;
        }
        aura = beta;
        weaponChosenFirst = true;
      });
    }
  }
  _handleSemblanceChoice(BuildContext context)async {
    Semblance beta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseSemblance()));

    if (beta != null && beta.name.isNotEmpty) {
      setState(() {
        semblanceBool = false;
        equppiedBool = true;
        semblanceChosen= beta.name;
        semblance= beta;
      });
    }
  }

  _handleItemEquip(BuildContext context)async{
   if(itemsHaveSelect==false){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select items first')));
    }else{
      List<RemnantItem> _gamma = await  Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectStartingEquip()));

      debugPrint("Length of gamma" + _gamma.length.toString());
      if (_gamma!=null&&_gamma.length==3){
        setState(() {
          equppiedBool = false;
          primaryBool = true;
          items.add(_gamma[0]);
          items.add(_gamma[1]);
          items.add(_gamma[2]);
          equippedItems = EquippedItems(_gamma[0], _gamma[1], _gamma[2]);
          equip = _gamma[0].name + ' ' + _gamma[1].name + " " + _gamma[2].name;
          debugPrint(equip);

        });
        debugPrint('Equipped');
      }else{
        debugPrint('Something went wrong with _gamma');
      }


    }



  }
  _handlePrimaryStatsCreation(BuildContext context)async{
    PrimaryStats _delta = await Navigator.push(context,
    MaterialPageRoute(builder: (context)=> SetPrimaryStats()));

    if (_delta!=null){
      setState(() {
        primaryBool = false;
        skillsBool = true;
        primaryStats = _delta;
        choosePrimaries = "Str: " + _delta.str.toString() + " Dex: "
        + _delta.dex.toString() + 'Chr: ' + _delta.chr.toString() +
        ' Con: ' + _delta.con.toString() + ' Int: ' + _delta.intel.toString() +
        ' Wis: ' + _delta.wis.toString();
      });
      debugPrint('Set Primaries');

    }else{
      debugPrint('OOPS Something went wrong with Primaries');
    }
  }
  _handleSkillsSelection(BuildContext context) async{
    if (choosePrimaries != 'Choose your primary Stats' && primaryStats!=null){
      Skills _Epsilon = await Navigator.push(context,
      MaterialPageRoute(builder: (context)=> SetPlayerSkills(primaryStats.figureBonus(primaryStats.intel))));
      if(_Epsilon!=null){
        setState(() {
          skillsBool = false;
          featsBool = true;
          skills = _Epsilon;
          skillsHaveBeenSelected = 'Skills have been Seleceted';
        });
      }else{
        debugPrint('Something went wrong with Skill Selection');
      }
    }else{
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Selected Primary Skills First')));
    }

  }
  _handleFeatsSelection(BuildContext context) async{
    Feats _zeta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseFeats()));
    List<Feats> _Mu = new List();
    _Mu.add(_zeta);
    if (_Mu!=null && feats.length<1){

      setState(() {
        featsBool = false;
        allSelected = true;

        feats.add(_Mu[0]);
        chooseFeats = feats[0].name;
      });
    }else{
      debugPrint('oops feats ! = null');
    }
  }

}
