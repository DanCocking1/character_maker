import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChooseCitizenship extends StatefulWidget {
  @override
  _ChooseCitizenshipState createState() => _ChooseCitizenshipState();
}

class _ChooseCitizenshipState extends State<ChooseCitizenship> {
  List _kingdoms = ['Atlas', 'Vale', 'Mistral', 'Vacuo', 'Menagerie', 'White Fang', 'Independent', 'Rogue'];
  List _kindomDescriptions = [
    'A Cold, but technologically advanced kingdom, this is the kingdom Robots are most likely to hail from.',
    'The Kingdom that holds Beacon Academy, Arts and Self expression are very important to the kingdom,'
        'generally a more open and welcoming kingdom, before the fall of Beacon.',
    'A kingdom of Contrasts, Higer classes are known for arts and technology, with a strong link to the sea and sky,'
        'Lower classes of Mistral are home to thieves and assassins, the large and difficult to traverse territory'
        ' makes it easier for them to do their work',
    'A more wild and lawless, desert kingdom, the Acdemy of Shade provides it only real law and order, The capital is an'
        'oasis of life in the desert.',
    'The sanctuary of the faunus people, settled in hopes to get away from the prejudices common among the four kingdoms',
    'A rebel group of faunus, orginally protested the treatment of faunus in other kingdoms, the White Fang have become violent',
    'Not wishing to get caught up in the politics of the four kingdoms, settlements have grown up in the harsh grimm controlled areas of the world',
    'Neither wanting the secluded peace of Menagerie, nor willing to commit violent acts of the White Fang,'
        'Rogue groups make an existence as nomads between the kingdoms.',

  ];
  int _kingdomChoice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Choose Your Character\'s Citizenship'),
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.white,
            Colors.blue,
            Colors.lightGreen,
            Colors.orange,
          ],
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops:[0.0, 0.33, 0.66, 1.0] )
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: _kingdoms.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    color: Colors.black38,
                    child: RadioListTile(
                      value: index,
                      onChanged: _handleRadioTileChanged,
                      title: Text(_kingdoms[index]),
                      subtitle: Text(_kindomDescriptions[index]),
                      groupValue: _kingdomChoice,
                    ),
                  ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.red.shade900,
                    onPressed: (){
                      Navigator.pop(context, _kingdomChoice);
                    }, child: Text('Choose Kingdom')),
              ),
            )
          ],
        ),
      ),
    );
  }
  _handleRadioTileChanged(value){
    setState(() {
      _kingdomChoice = value;
    });
    debugPrint(_kingdoms[value]);
  }
}
