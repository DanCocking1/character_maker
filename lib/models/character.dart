import 'package:character_maker/models/feats.dart';
import 'package:character_maker/models/semblance.dart';
import 'package:character_maker/models/weapon.dart';
import 'package:character_maker/models/remnantItems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CharacterMeta{
  Character character;
  FirebaseUser currentUser;
}


class Character{

  String name;
  DateTime  created = new DateTime.now();
  String surname;
  int primaryColor;
  int secondaryColor;
  int age;
  String race;
  String gender;
  String faunusType;
  String citizenship;
  String occupation;
  String background;
  Weapon weapon;
  List<RemnantItem> items = new List();
  List<Feats>feats = new List<Feats>();
  Semblance semblance;
  Skills skills;
  Aura aura;
  EquippedItems equippedItems;
  DustPouch dustPouch;
  PrimaryStats primaryStats;
  int lien = 0;

  featsListToJson(){
    Map<String, Map<String, dynamic>> y = new Map<String, Map<String, dynamic>>();
    for(int b = 0; b<feats.length; b++){
      debugPrint('Adding feat ${feats[b].name}  \n' + b.toString() + ' ' + feats.length.toString());
      y.putIfAbsent(b.toString(), ()=>feats[b].toJson());
    }
    return y;

  }

  itemsListToJson(){
    Map<String, Map<String, dynamic>> x = new Map<String, Map<String, dynamic>>();
    for(int i = 0; i<items.length; i++){
      x.putIfAbsent(i.toString(),  () => items[i].toJson());
    }
    return x;
  }

  Character(this.name, this.surname, this.primaryColor, this.secondaryColor,
      this.age, this.race, this.gender, this.faunusType, this.citizenship, this.occupation,
      this.background);

  Character.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        created = json['created'],
        surname = json['surname'],
        primaryColor = int.parse(json['primaryColor']),
        secondaryColor = int.parse(json['secondaryColor']),
        age = json['age'],
        race = json['race'],
        gender = json['gender'],
        faunusType = json['faunusType'],
        citizenship = json['citizenship'],
        occupation = json['occupation'],
        background = json['background'];


  Map<String, dynamic> toFireBaseDB()=>
      {
       'name':name,
       'created':created,
       'surname':surname,
       'primaryColor':primaryColor.toString(),
       'secondaryColor':secondaryColor.toString(),
        'age':age,
        'race':race,
        'gender':gender,
        'faunusType':faunusType,
        'citizenship':citizenship,
        'occupation':occupation,
        'background':background,
        'Weapon':weapon.toJson(),
        'items':itemsListToJson(),
        'semblance':semblance.toJson(),
        'skills':skills.toJson(),
        'aura':aura.toJson(),
        'equippedItems':equippedItems.toJson(),
        'dustPouch':dustPouch.toJson(),
        'primaryStats':primaryStats.toJson(),
        'lien':lien,
        'feats':featsListToJson(),


      };




}