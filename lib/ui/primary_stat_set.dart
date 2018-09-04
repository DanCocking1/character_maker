import'package:flutter/material.dart';
import 'dart:math';

import 'package:character_maker/models/semblance.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SetPrimaryStats extends StatefulWidget {
  @override
  _SetPrimaryStatsState createState() => _SetPrimaryStatsState();
}

class _SetPrimaryStatsState extends State<SetPrimaryStats> with TickerProviderStateMixin{
  @override
  TabController _tabController;
  var _randg;
  int _str = 10;
  int _dex = 10;
  int _con = 10;
  int _chr = 10;
  int _wis = 10;
  int _intel = 10;
  int _budget = 15;
  List<int> _rolled = new List();
  List<int> _chose = new List();
  TextEditingController _strength = new TextEditingController();
  TextEditingController _dexterity = new TextEditingController();
  TextEditingController _constitution = new TextEditingController();
  TextEditingController _charisma = new TextEditingController();
  TextEditingController _wisdom = new TextEditingController();
  TextEditingController _intelligence = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rolled.add(_get4d6Roll());
    _rolled.add(_get4d6Roll());
    _rolled.add(_get4d6Roll());
    _rolled.add(_get4d6Roll());
    _rolled.add(_get4d6Roll());
    _rolled.add(_get4d6Roll());
    _randg = new Random.secure();
    _tabController = new TabController(length: 3, vsync: this);


  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Choose primary Stat Set'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: ('4d6 Method'),),
            Tab(text: ('Point Assign')),
            Tab(text: ('Roll my own'),)
          ],
        ),
      ),
      body: Builder(
        builder: (context) =>
        TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[
                  Colors.grey.shade600,
                  Colors.grey.shade800,
                  Colors.blueGrey.shade700,
                  Colors.blueGrey.shade900
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0,0.33,0.67,1.0],
                tileMode: TileMode.clamp)
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Choose a value for each of your 6 primary Stats",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.2,
                        ),),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Rolled Values',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16.2,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                            ),),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Primary Stats',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 16.2,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                ),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.indigo.shade900,
                                  foregroundColor: Colors.deepOrange.shade900,
                                  child: Text(_rolled[0].toString()),
                                ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              controller: _strength,
                              decoration: InputDecoration(
                                labelText: 'Strength'
                              ),

                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade900,
                                foregroundColor: Colors.deepOrange.shade900,
                                child: Text(_rolled[1].toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              controller: _dexterity,
                              decoration: InputDecoration(
                                  labelText: 'Dexterity'
                              ),

                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade900,
                                foregroundColor: Colors.deepOrange.shade900,
                                child: Text(_rolled[2].toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              controller: _constitution,
                              decoration: InputDecoration(
                                  labelText: 'Constitution'
                              ),

                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade900,
                                foregroundColor: Colors.deepOrange.shade900,
                                child: Text(_rolled[3].toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              controller: _charisma,
                              decoration: InputDecoration(
                                  labelText: 'Charisma'
                              ),

                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade900,
                                foregroundColor: Colors.deepOrange.shade900,
                                child: Text(_rolled[4].toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              controller: _wisdom,
                              decoration: InputDecoration(
                                  labelText: 'Wisdom'
                              ),

                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade900,
                                foregroundColor: Colors.deepOrange.shade900,
                                child: Text(_rolled[5].toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _intelligence,
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              decoration: InputDecoration(
                                  labelText: 'Intelligence'
                              ),

                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.2,),
                      Container(
                        child: Center(
                          child: FlatButton(
                            color: Colors.red.shade900,
                              onPressed:(){
                                setState(() {
                                  if(_strength.text.isNotEmpty && _dexterity.text.isNotEmpty
                                  && _constitution.text.isNotEmpty && _charisma.text.isNotEmpty
                                  && _wisdom.text.isNotEmpty && _intelligence.text.isNotEmpty){
                                    _str = int.parse(_strength.text);
                                    _chose.add(_str);
                                    _dex = int.parse(_dexterity.text);
                                    _chose.add(_dex);
                                    _con = int.parse(_constitution.text);
                                    _chose.add(_con);
                                    _chr = int.parse(_constitution.text);
                                    _chose.add(_con);
                                    _intel = int.parse(_intelligence.text);
                                    _chose.add(_intel);
                                    _wis = int.parse(_wisdom.text);
                                    _chose.add(_wis);
                                    if(_chose.sort == _rolled.sort){
                                      PrimaryStats _alpha = new PrimaryStats(_str, _dex, _con, _chr, _intel, _wis);
                                      Navigator.pop(context, _alpha);
                                    }
                                    else{
                                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please use given rolled values')));
                                    }
                                  }
                                  else{
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please fill out all values')));
                                  }

                                });
                              }, child: Text('Accept')),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Colors.grey.shade600,
                    Colors.grey.shade800,
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade900
                  ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0,0.33,0.67,1.0],
                      tileMode: TileMode.clamp)
              ),
              child: ListView(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Points to spend: " + _budget.toString(),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 20.7,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_str>0){
                                setState(() {
                                  _str-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                           ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Strength\n     ' + _str.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _str+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                  child: Container(
                    color: Colors.black87,
                  ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_dex>0){
                                setState(() {
                                  _dex-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Dexterity\n     ' + _dex.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _dex+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_con>0){
                                setState(() {
                                  _con-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Constitution\n        ' + _con.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _con+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_chr>0){
                                setState(() {
                                  _chr-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Charisma\n      ' + _chr.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _chr+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_wis>0){
                                setState(() {
                                  _wis-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Wisdom\n     ' + _wis.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _wis+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.indigo.shade900,
                            child: Icon(Icons.arrow_downward),
                            onPressed: (){
                              if (_intel>0){
                                setState(() {
                                  _intel-=1;
                                  _budget+=1;
                                });
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: Text('Intelligence\n        ' + _intel.toString()))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.deepOrange.shade900,
                            child: Icon(Icons.arrow_upward),
                            onPressed: (){
                              if(_budget>0){
                                setState(() {
                                  _intel+=1;
                                  _budget-=1;
                                });

                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                    "Value can't be less than 0")));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.2, width: double.infinity,
                    child: Container(
                      color: Colors.black87,
                    ),),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.red.shade900,
                        child: Text('Confirm'),
                        onPressed: (){
                          if(_budget == 0){
                            PrimaryStats _beta = new PrimaryStats(_str, _dex, _con, _chr, _intel, _wis);
                            Navigator.pop(context, _beta);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Colors.grey.shade600,
                    Colors.grey.shade800,
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade900
                  ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0,0.33,0.67,1.0],
                      tileMode: TileMode.clamp)
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _strength,
                      decoration: InputDecoration(
                        labelText: 'Strength'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _dexterity,
                      decoration: InputDecoration(
                          labelText: 'Dexterity'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _constitution,
                      decoration: InputDecoration(
                          labelText: 'Constitution'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _charisma,
                      decoration: InputDecoration(
                          labelText: 'Charisma'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _wisdom,
                      decoration: InputDecoration(
                          labelText: 'Wisdom'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed:false, decimal: false),
                      controller: _intelligence,
                      decoration: InputDecoration(
                          labelText: 'Intelligence'
                      ),
                    ),
                  ),
                  SizedBox(height: 20.2, width: double.infinity,
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.red.shade900,
                        child: Text('Confirm'),
                        onPressed: (){
                          if(_strength.text.isNotEmpty && _dexterity.text.isNotEmpty &&
                          _charisma.text.isNotEmpty && _constitution.text.isNotEmpty &&
                          _wisdom.text.isNotEmpty && _intelligence.text.isNotEmpty){
                            PrimaryStats _gamma = PrimaryStats(
                                int.parse(_strength.text),
                                int.parse(_dexterity.text),
                                int.parse(_constitution.text),
                                int.parse(_charisma.text),
                                int.parse(_intelligence.text),
                                int.parse(_wisdom.text));
                            Navigator.pop(context, _gamma);
                          }
                          else{
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please fill all values')));
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  int _get4d6Roll(){
    var x = new Random.secure();
    int a = x.nextInt(6) + 1;
    if(a==1){
      a = x.nextInt(6) + 1;
    }
    int b = x.nextInt(6) + 1;
    if (b==1){
      b = x.nextInt(6) + 1;
    }
    int c = x.nextInt(6) + 1;
    if (c ==1){
      c = x.nextInt(6) + 1;
    }
    int d = x.nextInt(6) + 1;
    if (d==1){
      d = x.nextInt(6) + 1;
    }
    List<int> _rolling = [a, b, c, d];
    _rolling.sort();
    return _rolling[1] + _rolling[2] + _rolling[3];
  }
}
