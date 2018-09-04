

import 'package:flutter/material.dart';
import 'package:character_maker/models/character.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';

class EditCharacter extends StatelessWidget {
  final Character edit;
  EditCharacter(this.edit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GradientAppBar(
          backgroundColorStart: Colors.grey.shade700,
          backgroundColorEnd: Colors.blueGrey.shade900,
          title: Text('Edit ${edit.name + " " + edit.surname} Character')),
      body: EditCharacterMaker(edit),
    );
  }
}
class EditCharacterMaker extends StatefulWidget {
  final Character _edit;
  EditCharacterMaker(this._edit);
  @override
  _EditCharacterMakerState createState() => _EditCharacterMakerState();
}

class _EditCharacterMakerState extends State<EditCharacterMaker> {


  Character _toEdit;

  TextEditingController _delete = new TextEditingController();


  @override
  void initState() {
    super.initState();
    _toEdit = widget._edit;




  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors:
          [
            Colors.red.shade700,
            Colors.black87,
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0]
          )
      ),
      child: Column(
        children: <Widget>[
          Text('Deleted Characters CANNOT be recovered',
          style: TextStyle(
            fontSize: 22.2,
            fontWeight: FontWeight.bold,
          ),
            textAlign: TextAlign.center,),
          TextField(
            controller: _delete,
            decoration: InputDecoration(
              labelText: 'Type DELETE to delete ${_toEdit.name}',
              icon: Icon(Icons.delete_forever),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.green.shade900,
                      child: Text('Cancel'),
                        onPressed:()=> Navigator.pop(context)),
                  ),
                ),
              ),
              Expanded(
                child:  Center(
                  child: RaisedButton(
                    color: Colors.red.shade900,
                      child: Text('Delete ' + _toEdit.name),
                      onPressed: () {
                        if(_delete.text == 'DELETE'){
                          setState(() {
                            _toEdit.name = 'DELETE';
                            _toEdit.surname = 'DELETE';
                          });
                          Navigator.pop(context, _toEdit);
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Must type DELETE to delete character')));
                        }
                      }),
                ),
              )
            ],
          )
        ],
      )
    );
  }


}
