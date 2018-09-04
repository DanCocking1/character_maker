import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'package:character_maker/models/semblance.dart';

class ChooseSemblance extends StatefulWidget {
  @override
  _ChooseSemblanceState createState() => _ChooseSemblanceState();
}

class _ChooseSemblanceState extends State<ChooseSemblance> {
  int _choice = 0;
  List<Semblance> _choices = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choices = AvailableSemblance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Choose your Semblance'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[
              Colors.red.shade900,
              Colors.amber.shade700,
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0])
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Pick your Character's Semblance",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.7,

                ),
                textAlign: TextAlign.center,),
              Flexible(
                child: ListView.builder(
                  itemCount: _choices.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    color: Colors.black54,
                    child: RadioListTile(
                        title: Text(_choices[index].name, style: TextStyle(color: Colors.white70),),
                        subtitle: Text(_choices[index].description, style: TextStyle(color: Colors.white70),),
                        value: index,
                        groupValue: _choice, onChanged: _handleAuraChange),

                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.black,
                        child: Text('Semblance', style: TextStyle(color: Colors.white70),),
                        onPressed: (){
                          if(_choice!=null){
                            Navigator.pop(context, _choices[_choice]);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _handleAuraChange(value){
    setState(() {
      _choice = value;
    });
    debugPrint('Chose: ${_choices[value].name}');
  }
}