import 'package:character_maker/items/add_item.dart';
import 'package:character_maker/items/item_change.dart';
import 'package:character_maker/items/show_item.dart';
import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:flutter/material.dart';


class Items extends StatelessWidget {
  final List<RemnantItem> currentList;
  final BaseAuth auth;
  Items(this.currentList, this.auth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Creator'),
        backgroundColor: Colors.green,
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
        child: ItemList(currentList, auth),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List<RemnantItem> currentList;
  final BaseAuth auth;
  ItemList(this.currentList, this.auth);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<RemnantItem> itemsToList = new List<RemnantItem>();
  List<RemnantItem> itemsToList2 = new List<RemnantItem>();

  //TextEditingController _name = new TextEditingController();
  String testString = " ";

  @override
  void initState() {
    super.initState();
    itemsToList = widget.currentList;
    debugPrint(itemsToList.length.toString() + 'Test');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
                  itemCount: itemsToList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Text(itemsToList[index].amount.toString()),
                          ),
                          title: Text('${itemsToList[index].name}'),
                          subtitle: Text('${itemsToList[index].description}'),
                          onTap: () {
                            _showItemDetail(context, itemsToList[index]);
                          },
                          onLongPress: () {
                            _editItem(context, itemsToList[index], index);
                          },
                        ),
                      ))),
          Text(testString),
          RaisedButton(
              child: Text('Add Item'),
              onPressed: () {
                _goToNextString(context);
              }
          ),
          RaisedButton(
            child: Text('Save Items'),
            onPressed: () {
              _goToSavedItems(context, itemsToList);
            },
          )
        ]
        )

    );
  }

  _showItemDetail(BuildContext context, RemnantItem item) async {
    String a = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowItem(item)),
    );
    if (a == 'Delete' && itemsToList.length > 1) {
      print(itemsToList.length.toString());
      setState(() {
        itemsToList.remove(item);
        print(itemsToList.length.toString());
        print('Removed ${item.name}');
      });
    } else {
      if (a == 'Delete') {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Cannot Delete Last Item')));
      }
    }
  }

  _goToNextString(BuildContext context) async {
    itemsToList2 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItem(itemsToList)),
    );
    if (itemsToList2.length != null && itemsToList2.isNotEmpty) {
      setState(() {
        itemsToList = itemsToList2;
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("${itemsToList[0].toString()}")));
      });
    }
  }

  _editItem(BuildContext context, RemnantItem item, int index) async {
    itemsToList2[index] = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangeItem(itemsToList[index])),
    );
    if (itemsToList2.length != null && itemsToList2.isNotEmpty) {
      setState(() {
        itemsToList[index] = itemsToList2[index];
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Changed: ${itemsToList[index].name}'))
        );
      });
    }
  }
  _goToSavedItems(BuildContext context, List<RemnantItem> save){
    if(save!=null && save.length!=0){
          Navigator.pop(context, save);
    }
  }

}
