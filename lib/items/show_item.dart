import 'package:flutter/material.dart';
import 'package:character_maker/models/remnantItems.dart';

class ShowItem extends StatelessWidget {
  final RemnantItem item;
  ShowItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(item.name),
      ),
      body: Container(
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
                Center(
                  child: Wrap(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            item.description,
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 19.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title:  Text('Is the ${item.name} Equipped?'),
                          subtitle: Text('${item.isEquipped.toString()}'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: ListTile(
                            title: Text('Is the ${item.name} magical? '),
                            subtitle: Text('${item.isMagical.toString()}')
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title:  Text('Equip Location:      ${item.armorLocation}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(onPressed:(){
                      Navigator.pop(context, "Keep");
                    },
                        color: Colors.greenAccent.shade700,
                        child: Text('Ok')),
                  ),
                ),
                SizedBox(width: 16.0,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(onPressed: (){
                      Navigator.pop(context, 'Delete');
                    }, child: Text('Delete'),
                      color: Colors.red,),
                  ),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
