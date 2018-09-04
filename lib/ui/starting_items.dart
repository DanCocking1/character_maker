import 'package:character_maker/models/remnantItems.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gradient_app_bar/gradient_app_bar.dart';
class StartingItems extends StatefulWidget {
  @override
  _StartingItemsState createState() => _StartingItemsState();
}

class _StartingItemsState extends State<StartingItems> {
  List<RemnantItem> startingItems = new List();
  var _rng = new Random.secure();
  int _lien = 0;
  int _wealthSelector =0;
  int _kit = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lien = (_rng.nextInt(4) + 1) * 10;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          backgroundColorStart: Colors.grey.shade700,
          backgroundColorEnd: Colors.blueGrey.shade900,
          title: Text('Choose Starting Item Pack'),
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.black87,
            Colors.black54,
            Colors.green.shade700,
            Colors.green.shade900
          ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.1, 0.5, 1.0],
          )
        ),
        child: Center(
          child: ListView(
              children: <Widget>[
          Column(
          children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
          child: Text("Choose Character's Starting Lien",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.3
            ),
            textAlign: TextAlign.center,),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile(
                value: 0,
                groupValue:_wealthSelector ,
                title: Text('Poor'),
                subtitle: Text('1d4 * 10 Lien'),
                onChanged: _handleWealthChange,
              ),
            ),
            Expanded(
              child: RadioListTile(
                  title: Text('Middle Class'),
                  subtitle: Text('2d6 * 10'),
                  value: 1, groupValue: _wealthSelector,
                  onChanged: _handleWealthChange),
            )
          ],

        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile(
                value: 2,
                groupValue:_wealthSelector ,
                title: Text('Well Off'),
                subtitle: Text('2d10 * 10 Lien'),
                onChanged: _handleWealthChange,
              ),
            ),
            Expanded(
              child: RadioListTile(
                  title: Text('Rich'),
                  subtitle: Text('2d20 * 10'),
                  value: 3, groupValue: _wealthSelector,
                  onChanged: _handleWealthChange),
            )
          ],

        ),
        Text('Starting Lien:  ${_lien.toString()}',
          style: TextStyle(
              fontSize: 18.7,
              fontStyle: FontStyle.italic
          ),),
        SizedBox(height: 8.0,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.black54,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Choose a Starting Kit",
                    style: TextStyle(
                      fontSize: 18.7,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('You will be able to purchase additional supplies with Lien'),
                ),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),
                RadioListTile(
                    title: Text("Burglar's Pack\nDagger\nBedroll\n10 Rations\nBackpack"),
                    value: 0,
                    groupValue: _kit,
                    onChanged:_handleKitChange),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),

                RadioListTile(
                    title: Text("Diplomat's Pack\nSharp Quill\nBedroll\n10 Rations\nBackpack"),
                    value: 1,
                    groupValue: _kit,
                    onChanged: _handleKitChange),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),
                RadioListTile(
                    title: Text("Dungeoneer's Pack\nPickaxe\nBedroll\n10 Rations\nBackpack"),
                    value: 2,
                    groupValue: _kit,
                    onChanged:_handleKitChange),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),

                RadioListTile(
                    title: Text("Entertainer's Pack\nInstrument of choice\nBedroll\n10 Rations\nBackpack"),
                    value: 3,
                    groupValue: _kit,
                    onChanged: _handleKitChange),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),
                RadioListTile(
                    title: Text("Explorer's Pack\nCompass\nBedroll\n10 Rations\nBackpack"),
                    value: 4,
                    groupValue: _kit,
                    onChanged:_handleKitChange),
                Container(
                  color: Colors.black,
                  child: SizedBox(height: 6.0, width: double.infinity,),
                ),

                RadioListTile(
                    title: Text("Scholar's Pack\nLamp\nBedroll\n10 Rations\nBackpack"),
                    value: 5,
                    groupValue: _kit,
                    onChanged: _handleKitChange),
              ],
            ),
          ),
        ),

        ],

      ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(

                    child: RaisedButton(
                      color: Colors.blueGrey.shade900,
                      child: Text('Select Supplies'),
                      onPressed: () {
                        _handleFinishedItemsChoice(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
      ]
    ),


          )


      )
    );
  }
  _handleWealthChange(value){
    setState(() {
      _wealthSelector = value;
      if(value == 0){
        _lien = (_rng.nextInt(4) +1) * 10;
      }else if(value == 1){
        _lien = ((_rng.nextInt(6) + 1) + (_rng.nextInt(6) + 1)) *10;
      }else if(value==2){
        _lien = ((_rng.nextInt(10) + 1) + (_rng.nextInt(10) + 1)) *10;
      }else if(value==3){
        _lien = ((_rng.nextInt(20) + 1) + (_rng.nextInt(20) + 1)) *10;
      }
    });
  }
  _handleKitChange(value){
    setState(() {
      _kit =value;
    });
  }
  _handleFinishedItemsChoice(BuildContext context){
    debugPrint('Check Supplies');
    if(_kit == 0){
      startingItems = new List<RemnantItem>();
      startingItems.add(RemnantItem('Ballbearings', 'Bag  Ballbearings', false, false, 0, 0));
      startingItems[0].amount = 1000;
      startingItems.add(RemnantItem('String', '10 foot of string', false, false, 0, 0));
      startingItems.add(RemnantItem('bell', 'A small bell', false, false, 0, 0));
      startingItems.add(RemnantItem('Candle', 'A small candle', false, false, 0, 0));
      startingItems[3].amount = 5;
      startingItems.add(RemnantItem('Crowbar', 'A pry bar', false, false, 0, 0));
      startingItems.add(RemnantItem('Hammer', 'for nailing things not battle', false, false, 0, 0));
      startingItems.add(RemnantItem('Pitons', 'For Climbing', false, false, 0, 0));
      startingItems[6].amount = 10;
      startingItems.add(RemnantItem('Hooded Latern', 'Light without being seen from long range', false, false, 0, 0));
      startingItems.add(RemnantItem('Flask of oil', 'For greasing or fire puposes', false, false, 0, 0));
      startingItems[8].amount = 2;
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[9].amount = 15;
      startingItems.add(RemnantItem('Tinderbox', 'For starting small fires', false, false, 0, 0));
      startingItems.add(RemnantItem('Waterskin', 'Holds a days worth of water, maybe two', false, false, 0, 0));
      startingItems.add(RemnantItem('Hempen Rope', '50 feet of good rope', false, false, 0, 0));
      startingItems.add(RemnantItem('dagger', 'Basic dagger', false, false, 0, 0));
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
    }else if (_kit==1){
      startingItems = new List<RemnantItem>();
      startingItems.add(RemnantItem('chest', 'to keep items safe', false, false, 0, 0));
      startingItems.add(RemnantItem('Map Cases', 'Could hold maps or scrolls(but not those scrolls)', false, false, 0, 0));
      startingItems[1].amount = 2;
      startingItems.add(RemnantItem('Fine Set of clothes', 'for fine events', false, false, 0, 0));
      startingItems.add(RemnantItem('Ink Bottle', 'Always need ink to write', false, false, 0, 0));
      startingItems.add(RemnantItem('ink pen', 'Just for writing', false, false, 0, 0));
      startingItems.add(RemnantItem('lamp', 'for light, but not concealed', false, false, 0, 0));
      startingItems.add(RemnantItem('Flask of oil', 'For greasing or fire puposes', false, false, 0, 0));
      startingItems[6].amount = 2;
      startingItems.add(RemnantItem('Paper', 'for Writing on', false, false, 0, 0));
      startingItems[7].amount = 5;
      startingItems.add(RemnantItem('Vial of perfume', 'You might smell better', false, false, 0, 0));
      startingItems.add(RemnantItem('Sealing wax', 'Important papers need to be sealed', false , false, 0, 0));
      startingItems.add(RemnantItem('Soap', 'Adventuring is a dirty job', false, false, 0, 0));
      startingItems.add(RemnantItem('Sharp Quill', 'Sharp enough to draw blood', false, false, 0, 0));
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[14].amount = 10;


    }
    else if (_kit == 2){//Dugeoneer's
      startingItems = new List<RemnantItem>();//ensure   we are not getting everytime
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[2].amount = 10;
      startingItems.add(RemnantItem('crowbar', 'a pry bar type item ', false, false, 0, 0));
      startingItems.add(RemnantItem('Hammer', 'for nailing things not battle', false, false, 0, 0));
      startingItems.add(RemnantItem('Pitons', 'For Climbing', false, false, 0, 0));
      startingItems[5].amount = 10;
      startingItems.add(RemnantItem('Torches', 'for exploring dark places', false, false, 0, 0));
      startingItems[6].amount = 10;
      startingItems.add(RemnantItem('Tinderbox', 'For starting small fires', false, false, 0, 0));
      startingItems.add(RemnantItem('Waterskin', 'Holds a days worth of water, maybe two', false, false, 0, 0));
      startingItems.add(RemnantItem('Hempen Rope', '50 feet of good rope', false, false, 0, 0));
      
      

    }else if (_kit == 3){//Entertainer's
      startingItems = new List<RemnantItem>();//ensure   we are not getting everytime
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[2].amount = 20;
      startingItems.add(RemnantItem('Instrument of Choice', 'Any instrument', false, false, 0, 0));
      startingItems.add(RemnantItem('Waterskin', 'Holds a days worth of water, maybe two', false, false, 0, 0));
      startingItems.add(RemnantItem('Candle', 'A small candle', false, false, 0, 0));
      startingItems[5].amount = 5;
      startingItems.add(RemnantItem('Disguise kit', 'For making passable disguises', false, false, 0, 0));
      startingItems.add(RemnantItem('Costume', 'Works well with disguise kit', false, false, 0, 0));
      startingItems[7].amount = 2;
      
      
    }else if (_kit ==4){//Explorer's
      startingItems = new List<RemnantItem>();//ensure   we are not getting everytime
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[2].amount = 15;
      startingItems.add(RemnantItem('Torches', 'for exploring dark places', false, false, 0, 0));
      startingItems[3].amount = 10;
      startingItems.add(RemnantItem('Tinderbox', 'For starting small fires', false, false, 0, 0));
      startingItems.add(RemnantItem('Waterskin', 'Holds a days worth of water, maybe two', false, false, 0, 0));
      startingItems.add(RemnantItem('Hempen Rope', '50 feet of good rope', false, false, 0, 0));
      startingItems.add(RemnantItem('Mess kit', 'Eating utensils, better than using your hands', false, false, 0, 0));
      startingItems.add(RemnantItem('Compass', 'To keep from getting too lost', false, false, 0, 0));

    }else if(_kit == 5){//Scholar's
      startingItems = new List<RemnantItem>();//ensure   we are not getting everytime
      startingItems.add(RemnantItem('bedroll', 'For sleeping in the wilds', false, false, 0, 0));
      startingItems.add(RemnantItem('Backpack', 'For holding all this stuff', false, false, 0, 0));
      startingItems.add(RemnantItem('Rations', 'Adequate food stuffs for a day', false, false, 0, 0));
      startingItems[2].amount = 10;
      startingItems.add(RemnantItem('Hooded Latern', 'Light without being seen from long range', false, false, 0, 0));
      startingItems.add(RemnantItem('Book of Lore', 'Could be a fairytale collection', false, false, 0, 0));
      startingItems.add(RemnantItem('Ink Bottle', 'Always need ink to write', false, false, 0, 0));
      startingItems.add(RemnantItem('ink pen', 'Just for writing', false, false, 0, 0));
      startingItems.add(RemnantItem('Bag of sand', 'small bag to use as a paperweight', false, false, 0, 0));
      startingItems.add(RemnantItem('Small knife', 'not good for fighting', false, false, 0, 0));

    }
    if(startingItems!= null &&  startingItems.length!=0){
        StarterItems start = new StarterItems(startingItems, _lien);
        Navigator.pop(context, start);
     debugPrint('Lien not chosen ' + _lien.toString()
         +" "+ startingItems.length.toString());
    }
    else{
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Select starting kit')));
    }

    debugPrint(startingItems.length.toString());
  }
}
