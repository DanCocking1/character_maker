import 'package:character_maker/items/item_change.dart';
import 'package:character_maker/models/character.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChangeEquipped extends StatefulWidget {
  final Character _charToChange;
  final int _itemLocation;
  ChangeEquipped(this._charToChange, this._itemLocation);
  @override
  _ChangeEquippedState createState() => _ChangeEquippedState();
}

class _ChangeEquippedState extends State<ChangeEquipped> {
  int _radioValue = 0;
  EquippedItems _equipped;
  String _itemLocale;
  Character _charToReturn;
  RemnantItem _currentSlotted = new RemnantItem('none', 'none', false, false, 0, 0);
  List<RemnantItem> _listedItems = new List<RemnantItem>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _charToReturn = widget._charToChange;
    _equipped = widget._charToChange.equippedItems;
   for(RemnantItem _x in widget._charToChange.items){
     if(_x.location == widget._itemLocation){
       _listedItems.add(_x);
       if(_x.isEquipped == true){
         _currentSlotted = _x;
       }
     }
   }
   _itemLocale = _currentSlotted.armorPlacement(_currentSlotted.location);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
      title: Text('Equip $_itemLocale'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.grey.shade700,
            Colors.grey.shade900,
          ],
          stops: [0.0,1.0],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft)
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: _listedItems.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    color: Colors.white10,
                    child: RadioListTile(
                        title: Text(_listedItems[index].name),
                        subtitle: Text(_listedItems[index].description),
                        value: index,
                        groupValue: _radioValue,
                        onChanged: _handleRadioItemChanged),
                  )),
            ),
            RaisedButton(
              color: Colors.green.shade800,
              child: Text('Add an Item'),
              onPressed: (){
                debugPrint(_currentSlotted.name);
                _handleItemAddition();

              },
            ),
            RaisedButton(
              child: Text('Save'),
              color: Colors.red,
              onPressed: (){
                if(_charToReturn != widget._charToChange){
                  Navigator.pop(context, _charToReturn);
                }
                else{
                  Navigator.pop(context, widget._charToChange);
                }

              },
            )
          ],
        ),
      ),
    );
  }
  _handleRadioItemChanged(value){
    setState(() {
      _radioValue = value;
      _currentSlotted = _listedItems[_radioValue];
      if(_itemLocale == 'Body'){
        _charToReturn.equippedItems.body = _currentSlotted;
      }else if(_itemLocale == 'Back'){
        _charToReturn.equippedItems.back = _currentSlotted;
      }else if(_itemLocale == 'Shoes'){
        _charToReturn.equippedItems.shoes = _currentSlotted;
      }else if(_itemLocale == 'Neck'){
        _charToReturn.equippedItems.neck = _currentSlotted;
      }else if(_itemLocale == 'Right Hand'){
        _charToReturn.equippedItems.rightHand = _currentSlotted;
      }else if(_itemLocale == 'Left Hand'){
        _charToReturn.equippedItems.leftHand = _currentSlotted;
      }
      for(RemnantItem notEquipped in widget._charToChange.items){
        if(notEquipped.name != _listedItems[_radioValue].name && notEquipped.location == _currentSlotted.location){
          notEquipped.isEquipped = false;
        }else if(notEquipped.location == _currentSlotted.location){
          notEquipped.isEquipped = true;
        }
      }

    });
    debugPrint(_listedItems[_radioValue].name + ' equipped: ' + _listedItems[_radioValue].isEquipped.toString());
  }
  _handleItemAddition() async{
    _currentSlotted.location = widget._itemLocation;
    _currentSlotted.armorLocation = _currentSlotted.armorPlacement(widget._itemLocation);
    RemnantItem _beta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChangeItem(_currentSlotted)));
    if(_beta !=null && _beta.name.isNotEmpty){
      setState(() {
        _charToReturn.items.add(_beta);
        _listedItems.add(_beta);
      });

    }
  }

}
