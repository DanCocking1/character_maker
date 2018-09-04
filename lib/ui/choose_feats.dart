import 'package:flutter/material.dart';

import 'package:character_maker/models/feats.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChooseFeats extends StatefulWidget {
  @override
  _ChooseFeatsState createState() => _ChooseFeatsState();
}

class _ChooseFeatsState extends State<ChooseFeats> {
  List<Feats> _feats = new List();
  int _choice = 0;

  @override
  void initState() {
    super.initState();
    _feats = AvailableFeats();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Select your Starting Feat'),

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.lightBlue.shade400,
            Colors.pinkAccent.shade700,
          ],
          begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]
          )
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose One Starting Feat', style: TextStyle(fontSize: 20.2),),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: _feats.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      color: Colors.white30,
                      child: RadioListTile(
                        title: Text(_feats[index].name + "\nRequires: " + _feats[index].requirements),
                          subtitle: Text(_feats[index].description),
                          value: index,
                          groupValue: _choice,
                          onChanged: _handleFeatsChange),

            )
                )
            ),
            RaisedButton(
              color: Colors.indigo.shade700,
              child: Text('Confirm'),
              onPressed: (){
                Navigator.pop(context, _feats[_choice]);
              },
            )
          ],
        ),
      ),
    );
  }
  _handleFeatsChange(value){
    setState(() {
      _choice = value;
    });
    debugPrint('Chose: ${_feats[value].name}');
  }
}
