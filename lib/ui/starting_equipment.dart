import 'package:flutter/material.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SelectStartingEquip extends StatefulWidget {
  @override
  _SelectStartingEquipState createState() => _SelectStartingEquipState();
}

class _SelectStartingEquipState extends State<SelectStartingEquip> {
  List<RemnantItem> _chosen = new List();
  List<RemnantItem> _body = new List();
  List<RemnantItem> _back = new List();
  List<RemnantItem> _shoes = new List();
  int _bodyint = 0;
  int _backint = 0;
  int _shoesint = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chosen.add(RemnantItem('Battle Dress', 'Combat Ready skirt blouse combo +5 speed + 1 AC', true, false, 1, 1));
    _chosen.add(RemnantItem('Hooded Cape', 'Flexible + 5 speed', true, false, 0, 2));
    _chosen.add(RemnantItem('Athletic Shoes', 'For moving fast +5 speed +1 dex checks', true, false, 0, 3));
    _body.add(RemnantItem('Battle Dress', 'Combat Ready skirt blouse combo +5 speed + 1 AC', true, false, 1, 1));
    _body.add(RemnantItem('Battle Business Formal', 'Stylish yet flexible + 5 speed + 1 AC', true, false, 1, 1));
    _body.add(RemnantItem('Medium Armor', 'Gender Neutral Armor -5 speed + 2 AC', true, false, 2, 1));
    _back.add(RemnantItem('Hooded Cape', 'Flexible + 5 speed', true, false, 0, 2));
    _back.add(RemnantItem('Stiff Shroud', 'Harder to move but stouter -5 speed + 1 AC', true, false, 1, 2));
    _shoes.add(RemnantItem('Athletic Shoes', 'For moving fast +5 speed +1 dex checks', true, false, 0, 3));
    _shoes.add(RemnantItem('Formal foot Wear', "looks stylish +1 to Chr checks", true, false, 0, 3));
    _shoes.add(RemnantItem('Work Boots', 'Heavy soled boots + 1 to Str', true, false, 0, 3));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Choose Equipped Items'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.green.shade700,
            Colors.pinkAccent.shade700,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 1.0]),
        ),
        child: Center(
          child: ListView(

            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Body',
                  style: TextStyle(
                    fontSize: 16.4,
                  ),
                textAlign: TextAlign.center,),
              ),
              Container(
                color: Colors.black87,
                  child: SizedBox(height: 2.0, width: double.infinity,)),
                  RadioListTile(
                    title: Text(_body[0].name),
                    subtitle: Text(_body[0].description),
                    value: 0,
                    groupValue: _bodyint,
                    onChanged: _handleBodyChange,
                  ),
                  RadioListTile(
                    title: Text(_body[1].name),
                    subtitle: Text(_body[1].description),
                    value: 1,
                    groupValue: _bodyint,
                    onChanged: _handleBodyChange,
                  ),
                  RadioListTile(
                    title: Text(_body[2].name),
                    subtitle: Text(_body[2].description),
                    value: 2,
                    groupValue: _bodyint,
                    onChanged: _handleBodyChange,
                  ),
              Container(
                  color: Colors.black87,
                  child: SizedBox(height: 2.0, width: double.infinity,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Back',
                  style: TextStyle(
                    fontSize: 16.4,
                  ),textAlign: TextAlign.center,),
              ),
              Container(
                  color: Colors.black87,
                  child: SizedBox(height: 2.0, width: double.infinity,)),
                  RadioListTile(
                    title: Text(_back[0].name),
                    subtitle: Text(_back[0].description),
                    value: 0,
                    groupValue: _backint,
                    onChanged: _handleBackChange,
                  ),
                  RadioListTile(
                    title: Text(_back[1].name),
                    subtitle: Text(_back[1].description),
                    value: 1,
                    groupValue: _backint,
                    onChanged: _handleBackChange,
                  ),
              Container(
                  color: Colors.black87,
                  child: SizedBox(height: 2.0, width: double.infinity,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Shoes',
                  style: TextStyle(
                    fontSize: 16.4,
                  ),textAlign: TextAlign.center,),
              ),
              Container(
                  color: Colors.black87,
                  child: SizedBox(height: 2.0, width: double.infinity,)),
                  RadioListTile(
                    title: Text(_shoes[0].name),
                    subtitle: Text(_shoes[0].description),
                    value: 0,
                    groupValue: _shoesint,
                    onChanged: _handleShoesChange,
                  ),
                  RadioListTile(
                    title: Text(_shoes[1].name),
                    subtitle: Text(_shoes[1].description),
                    value: 1,
                    groupValue: _shoesint,
                    onChanged: _handleShoesChange,
                  ),
                  RadioListTile(
                    title: Text(_shoes[2].name),
                    subtitle: Text(_shoes[2].description),
                    value: 2,
                    groupValue: _shoesint,
                    onChanged: _handleShoesChange,
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: FlatButton(
                    color: Colors.black87,
                    child: Text('I have Chosen', style: TextStyle(color: Colors.white70),),
                    onPressed: (){
                      setState(() {
                        _chosen[0] = (_body[_bodyint]);
                        if(_body==null){
                          print('Ooops no body!');
                        }
                        _chosen[1] = (_back[_backint]);
                        _chosen[2] = (_shoes[_shoesint]);
                      });
                      if(_chosen.length!=0 && _chosen.length==3){
                        debugPrint(_chosen[0].name);
                        debugPrint(_chosen.length.toString());
                        Navigator.pop(context, _chosen);
                      }else{
                        debugPrint('OOPS NOT Three things');
                      }

                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _handleBodyChange(value){
    setState(() {
      _bodyint = value;
    });
    debugPrint(_body[value].name);
  }
  _handleBackChange(value){
    setState(() {
      _backint = value;
    });
    debugPrint(_back[value].name);
  }
  _handleShoesChange(value){
    setState(() {
      _shoesint = value;
    });
    debugPrint(_shoes[value].name);
  }
}
