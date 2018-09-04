import 'package:flutter/material.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChooseAura extends StatefulWidget {
  @override
  _ChooseAuraState createState() => _ChooseAuraState();
}

class _ChooseAuraState extends State<ChooseAura> {
  int _choice = 0;
  List<Aura> _choices = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choices = AurasAvailble();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Choose your Aura Mod'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.deepPurple.shade900,
            Colors.deepOrange.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0])
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('How do you want to modify your character'"'s Aura",
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
                        title: Text(_choices[index].name,
                        style: TextStyle(color: Colors.white70),),
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
                        child: Text('Aura Chosen',
                        style: TextStyle(color: Colors.white70),),
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
