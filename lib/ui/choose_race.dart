import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChooseRace extends StatefulWidget {
  @override
  _ChooseRaceState createState() => _ChooseRaceState();
}

class _ChooseRaceState extends State<ChooseRace> {
  int _choice = 0;
  List _racesToChoose = ['Human', 'Faunus', 'Robot'];
  List _racialTraits = ['Human Characters start with a +1 to one a Primary Stat and +3 to a Skill',
  'Faunus are a human with animal characteristics, the player may choose'
      'darkvision and +3 to perception or +1 to two primary Stats',
  'Robotic players come from a knew generation of artifically intelligent and ensouled'
      'automatons, they do not gain levels via experience point, but by finding and researching'
      'upgrade parts, Start out at 1.0 which is eqiuvalent to level 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Choose Characters Race'),
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.grey.shade600,
            Colors.blueGrey.shade800,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0]),

        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: _racesToChoose.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    color: Colors.white10,
                    child: RadioListTile(
                      title: Text(_racesToChoose[index]),
                        subtitle: Text(_racialTraits[index]),
                        value: index,
                        groupValue: _choice,
                        onChanged: _handleRadioChange),
                  )),
            ),
            FlatButton(
              color: Colors.red.shade900,
              child: Text('Choose'),
              onPressed: (){
                Navigator.pop(context, _choice);
              },
            )
          ],
        ),
      ),
    );
  }
  _handleRadioChange(value){
    setState(() {
      _choice = value;
    });
    debugPrint(_racesToChoose[_choice]);
  }
}
