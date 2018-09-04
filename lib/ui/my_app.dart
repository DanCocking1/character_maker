import 'dart:async';
import 'package:character_maker/models/remnantItems.dart';
import 'package:intl/intl.dart';

import 'package:character_maker/models/auth.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:character_maker/models/weapon.dart';
import 'package:character_maker/models/feats.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:character_maker/models/character.dart';
import 'package:character_maker/ui/character_info.dart';
import 'package:character_maker/ui/create_character.dart';
import 'package:character_maker/ui/edit_character.dart';


class MyApp extends StatefulWidget {
  MyApp({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Character> personalList = new List();
  Character hero;
  String check = 'Not Yet';
  String _userId = '';
  Firestore fireStore = new Firestore();

  void _signOut() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e){
      debugPrint(e);

    }
  }


  initState() {
    //debugPrint(widget.userId.toString());
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        _userId = userId;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          accentColor: Colors.blueGrey,
        ),
        title: ('Character Creation'),
        home: Scaffold(
          appBar: GradientAppBar(
            backgroundColorStart: Colors.grey.shade700,
            backgroundColorEnd: Colors.blueGrey.shade900,
            title: Text('Chacacter List'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: _signOut,
              )
            ],
          ),
          body: StreamBuilder(
    stream: Firestore.instance.collection(_userId + '/remnantd20/characters').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
    if(!snapshot.hasData) return FlatButton(
      color: Colors.red,
     child: Text('Create First Character'),
      onPressed: (){
             debugPrint('Sending to character Creator...');
          },
        );
    return FireStoreListView(documents: snapshot.data.documents, auth: widget.auth,);
    },
    ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red.shade900,
              foregroundColor: Colors.blueGrey.shade800,
              child: Icon(Icons.add),
              onPressed:(){
              _createCharacterStart(context);
              }),
    )
    );
  }




  _createCharacterStart(BuildContext context)async{
    Character alpha = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateCharacter()));
    if(alpha!=null){

      setState(() {
        personalList.add(alpha);
      });
//      Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text("Added: ${alpha.name} ${alpha.surname}")));
      debugPrint(alpha.toFireBaseDB().toString());
      Firestore.instance.runTransaction((Transaction transaction) async{
        CollectionReference reference = Firestore.instance.collection(_userId).document('remnantd20').collection('characters');
        await reference.add(alpha.toFireBaseDB());
      });
    }else{
//      Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text("Created Character Cancelled")));
    }
  }
}
class FireStoreListView extends StatelessWidget {
  final BaseAuth auth;
  final List<DocumentSnapshot> documents;
  FireStoreListView({this.documents, this.auth});
  List<Character>personalList = new List<Character>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: documents.length,
        itemExtent: 90.0,
        itemBuilder: (BuildContext context, int index){
          var dataChar = documents[index].data;
          String title = documents[index].data['name'].toString() + ' ' + documents[index].data['surname'].toString();
          personalList.add(
            Character.fromJson(documents[index].data));
          personalList[index].weapon = Weapon.fromJson(Map<String, dynamic>.from(documents[index].data['Weapon']));
          personalList[index].skills = Skills.fromJson(Map<String, dynamic>.from(dataChar['skills']));
          personalList[index].primaryStats = PrimaryStats.fromJson(Map<String, dynamic>.from(dataChar['primaryStats']));
          personalList[index].semblance = Semblance.fromJson(Map<String, dynamic>.from(dataChar['semblance']));
          personalList[index].aura = Aura.fromJson(Map<String, dynamic>.from(dataChar['aura']));
          personalList[index].dustPouch =DustPouch.fromJson(Map<String, dynamic>.from(dataChar['dustPouch']));
          personalList[index].equippedItems = EquippedItems
          (RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['body'])),
          RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['back'])),
          RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['shoes'])),);
          personalList[index].equippedItems.neck = (RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['neck'])));
          personalList[index].equippedItems.leftHand = (RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['leftHand'])));
          personalList[index].equippedItems.rightHand = (RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['equippedItems']['rightHand'])));
          personalList[index].created = dataChar['created'];
          personalList[index].lien = dataChar['lien'];
          int _y = dataChar['items'].length;
          debugPrint('Item Total: ' + _y.toString());
          for(int _j = 0; _j<_y; _j++){
            personalList[index].items.add(RemnantItem.fromJson(Map<String, dynamic>.from(dataChar['items'][_j.toString()])));
          }
          int _x = dataChar['feats'].length;
          //debugPrint(dataChar['feats']['0']['name'].toString());
//          debugPrint(documents.length.toString());
//          print(personalList.length.toString());
          for(int _i = 0; _i<_x; _i++){
           // personalList[index].feats.add(Feats.fromJson(dataChar['feats'][_i.toString()]));
          //debugPrint(dataChar['feats'][_i.toString()]['name'].toString());
          personalList[index].feats.add(new Feats(
          dataChar['feats'][_i.toString()]['name'],
          dataChar['feats'][_i.toString()]['requirements'],
          dataChar['feats'][_i.toString()]['description'],));
          }
          debugPrint('Feats: ' + personalList[index].feats.length.toString());
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
          shape: StadiumBorder(),
            margin: EdgeInsets.all(1.0),
            elevation: 3.0,
              color: Color(int.parse(documents[index].data['primaryColor'].toString())),
              child: ListTile(
                onTap:()=> _goToCharacterInfo(context, personalList[index], index),

                leading: CircleAvatar(
                  backgroundColor: Color(int.parse(documents[index].data['secondaryColor'].toString())),
                  foregroundColor: Color(int.parse(documents[index].data['primaryColor'].toString())),
                  child: Text(documents[index].data['name'].toString()[0] + documents[index].data['surname'].toString()[0]),
                ),
                title: Text(title, style: TextStyle(color: Color(int.parse(documents[index].data['secondaryColor'].toString()))),),
            subtitle: Row(
              children: <Widget>[
                Text('Created: ' + new DateFormat.yMMMd().add_jm().format(dataChar['created']), style: TextStyle(color: Color(int.parse(documents[index].data['secondaryColor'].toString()))),),
                IconButton(
          alignment: Alignment.centerRight,
                onPressed: ()=> _goToCharacterEdit(context, personalList[index], index, documents),
                icon: Icon(Icons.delete),
          )
          ],
            ),
              ),
            ),
          );
        });
  }
  _goToCharacterEdit(BuildContext context, Character _Zeta, int index, List<DocumentSnapshot> target) async {
    //debugPrint('Deleteing ${_Zeta.name}  ${_Zeta.surname}');
    debugPrint(_Zeta.name);
    Character _epsilon = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditCharacter(_Zeta)));
    debugPrint(_Zeta.name);
    debugPrint('That Worked');
    var dbId = await auth.currentUser();
    debugPrint(dbId.toString());
    //debugPrint(_epsilon.name + _epsilon.surname);
    if (_epsilon.name == 'DELETE' && _epsilon.surname == 'DELETE') {
      //debugPrint('You are Deleteing ${_Zeta.name}');
      Firestore.instance.runTransaction((transaction) async{
        DocumentSnapshot snapshot =
            await transaction.get(documents[index].reference);
        await transaction.delete(snapshot.reference);
      });
    }
  }
  _goToCharacterInfo(BuildContext context, Character playerChar, int a ){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> CharacterInfo(playerChar, auth)));

  }


}
