import 'package:character_maker/models/remnantItems.dart';
import 'package:flutter/material.dart';


class ChangeItem extends StatelessWidget {
  final RemnantItem item;
  ChangeItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change ${item.name}'),
        backgroundColor: Colors.green,
      ),
      body: AddItemForm(item),
    );
  }
}

class AddItemForm extends StatefulWidget {
  final RemnantItem item;
  AddItemForm(this.item);
  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  RemnantItem itemToChange;
  TextEditingController _name = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  int _armorValue;
  int armorLocationValue = 0;
  bool isItemEquipped = false;
  bool isItemMagical = false;

  @override
  void initState() {
    super.initState();
    itemToChange = widget.item;
    _name.text = widget.item.name;
    _description.text = widget.item.description;
    isItemEquipped = widget.item.isEquipped;
    isItemMagical = widget.item.isMagical;
    armorLocationValue = widget.item.location;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [
            const Color(0xFF00fa9a),
            const Color(0xFFFF69B4)
          ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          )
      ),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white10,
                  child: Column(
                    children: <Widget>[
//  Debuging list                  Text('${listToAdd[0].name}'
//                    ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _name,
                          decoration: InputDecoration(
                              icon: Icon(Icons.note_add),
                              labelText: "Item's Name"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _description,
                          decoration: InputDecoration(
                              icon: Icon(Icons.description),
                              labelText: "Item's Description"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: itemToChange.location.toString(),
                          keyboardType: TextInputType.number,
                          validator: (val) =>
                          !int.parse(val).isNaN ? 'not a number' : null,
                          onSaved: (val) => _armorValue = int.parse(val),
                          //controller: _armorValue,
                          decoration: InputDecoration(
                              icon: Icon(Icons.show_chart),
                              labelText: 'Armor Value, 0 if not armor'
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white10,
                                child: CheckboxListTile(
                                  title: Text('is Equipped?'),
                                  value: isItemEquipped,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isItemEquipped = value;
                                    });
                                  },

                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white10,
                                child: CheckboxListTile(value: isItemMagical,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isItemMagical = value;
                                    });
                                  },
                                  title: Text("is Magical?"),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Container(
                        color: Colors.green,
                        child: Card(
                          color: Colors.white12,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text('Equip Location',
                                  style: TextStyle(
                                    fontSize: 16.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Can't"),
                                      value: 0,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Body"),
                                      value: 1,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Back"),
                                      value: 2,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Feet"),
                                      value: 3,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Neck"),
                                      value: 4,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text("Right Hand"),
                                      value: 5,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: RadioListTile<int>(
                                        title: Text("Left Hand"),
                                        value: 6,
                                        groupValue: armorLocationValue,
                                        onChanged: _handleRadioValueChanged,),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Amount',
                          style: TextStyle(
                            fontSize: 23.1
                          ),),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(onPressed:(){
                                setState(() {
                                  widget.item.amount -=1;
                                });

                              },
                              child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(widget.item.amount.toString(),
                              style: TextStyle(
                                fontSize: 22.9,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: Colors.green,
                                  onPressed: (){
                                    setState(() {
                                      widget.item.amount+=1;
                                    });
                                  },
                                  child: Icon(Icons.add)),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(
                                    color: Colors.indigo,
                                    child: Text('Save Item'),
                                    onPressed: (){
                                      if(_name.text!=null && _name.text.isNotEmpty
                                          && _description.text!=null && _description.text.isNotEmpty
                                      ){
                                        setState(() {
                                          itemToChange.name = _name.text;
                                          itemToChange.description = _description.text;
                                          itemToChange.isEquipped = isItemEquipped;
                                          itemToChange.isMagical = isItemMagical;
                                          itemToChange.armorValue = _armorValue;
                                          itemToChange.armorLocation =
                                              itemToChange.armorPlacement(armorLocationValue);
                                          itemToChange.location = armorLocationValue;
                                          itemToChange.amount = widget.item.amount;

                                        });
                                        Navigator.pop(context, itemToChange);

                                      }else{
                                        Scaffold
                                            .of(context)
                                            .showSnackBar(
                                            SnackBar(content: Text('Please Create Item With a name and description')));
                                      }

                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.2),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(

                                    color: Colors.red,
                                    onPressed:() {
                                      Navigator.pop(context, itemToChange);

                                    },
                                    child: Text('Cancel'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],

          ),
        ],
      ),
    );
  }
  void _handleRadioValueChanged(int value) {
    setState(() {
      armorLocationValue = value;
    });
    debugPrint(armorLocationValue.toString());

  }


}
