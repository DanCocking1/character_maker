import 'package:flutter/material.dart';

import 'package:character_maker/models/semblance.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SetPlayerSkills extends StatefulWidget {
  final int intBonus;
  SetPlayerSkills(this.intBonus);
  @override
  _SetPlayerSkillsState createState() => _SetPlayerSkillsState();
}

class _SetPlayerSkillsState extends State<SetPlayerSkills> {
  int _Budget;
  int _acro  =0;
  int _animal = 0;
  int _ath = 0;
  int _aura = 0;
  int _dec = 0;
  int _dust = 0;
  int _grimm = 0;
  int _his = 0;
  int _ins = 0;
  int _intim = 0;
  int _invest = 0;
  int _nat = 0;
  int _perception = 0;
  int _performance = 0;
  int _pers = 0;
  int _sleight = 0;
  int _stealth = 0;
  int _survival = 0;


  @override
  void initState() {
    super.initState();
    _Budget = 13 + widget.intBonus;  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Budget to Spend ' + _Budget.toString(),
          style: TextStyle(
            fontSize: 20.7,
            fontWeight: FontWeight.bold,
          ),),
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,

        
      ),
        body: Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
                Colors.red.shade900,
                Colors.blue.shade900,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0])
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Assign Your Skill Points')
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Available budget is 4 + 3 * 3 for starred skills + int bonus.',
                      textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Skill growth per level for your character is 4 + ' + widget.intBonus.toString()),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_acro>0){
                                    setState(() {
                                      _acro-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text('Acrobatics: \n        '  +_acro.toString())),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _acro+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                    child: Container(
                      color: Colors.indigo.shade900,
                    ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_animal>0){
                                    setState(() {
                                      _animal-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text('Animal Handling: \n             '  +_animal.toString())),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _animal+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_ath>0){
                                    setState(() {
                                      _ath-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text('Athletics: \n        '  +_ath.toString())),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _ath+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_aura>0){
                                    setState(() {
                                      _aura-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Aura:'),
                              Text(_aura.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _aura+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_dec>0){
                                    setState(() {
                                      _dec-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Deception:'),
                              Text(_dec.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _dec+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_dust>0){
                                    setState(() {
                                      _dust-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Dust:'),
                              Text(_dust.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _dust+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_grimm>0){
                                    setState(() {
                                      _grimm-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Grimm:'),
                              Text(_grimm.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _grimm+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_his>0){
                                    setState(() {
                                      _his-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('History:'),
                              Text(_his.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _his+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_ins>0){
                                    setState(() {
                                      _ins-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Insight:'),
                              Text(_ins.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _ins+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_intim>0){
                                    setState(() {
                                      _intim-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Intimidation:'),
                              Text(_intim.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _intim+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_invest>0){
                                    setState(() {
                                      _invest-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Investigation:'),
                              Text(_invest.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _invest+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_nat>0){
                                    setState(() {
                                      _nat-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Nature:'),
                              Text(_nat.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _nat+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_perception>0){
                                    setState(() {
                                      _perception-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Perception:'),
                              Text(_perception.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _perception+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_performance>0){
                                    setState(() {
                                      _performance-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Performance:'),
                              Text(_performance.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _performance+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_pers>0){
                                    setState(() {
                                      _pers-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Persuasion:'),
                              Text(_pers.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _pers+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_sleight>0){
                                    setState(() {
                                      _sleight-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Sleight of Hand:'),
                              Text(_sleight.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _sleight+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_stealth>0){
                                    setState(() {
                                      _stealth-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Stealth:'),
                              Text(_stealth.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _stealth+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.grey.shade600,
                                onPressed:(){
                                  if(_survival>0){
                                    setState(() {
                                      _survival-=1;
                                      _Budget+=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_downward)),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Column(
                            children: <Widget>[
                              Text('Survival:'),
                              Text(_survival.toString())
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                color: Colors.amberAccent.shade700,
                                onPressed:(){
                                  if(_Budget>0){
                                    setState(() {
                                      _survival+=1;
                                      _Budget-=1;
                                    });
                                  }
                                }, child: Icon(Icons.arrow_upward)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0, width: double.infinity,
                      child: Container(
                        color: Colors.indigo.shade900,
                      ),),
                    RaisedButton(
                      color: Colors.red.shade900,
                      onPressed: (){
                        if(_Budget==0){
                          Skills _skills = new Skills(_acro, _animal, _ath, _aura, _dec,
                              _dust, _grimm, _his, _ins, _intim, _invest, _nat,
                              _perception, _performance, _pers, _sleight,
                              _stealth, _survival);
                          Navigator.pop(context, _skills);
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Spend your budget')));
                        }
                      },
                      child: Text('Confirm'),
                    )
                  ],
                )
              ],

            ),
          ),
        )
    );
  }
}
