import 'package:character_maker/models/remnantItems.dart';

class Semblance {
  String name;
  String description;
  Semblance(this.name, this.description);


  Semblance.fromJson(Map<String, dynamic> json)
              : name = json['name'],
                description = json['description'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'description':description,
      };

}

List AvailableSemblance(){
  List<Semblance>  semblanceList = new List();
  semblanceList.add(Semblance('Blazing Soul', "Requires 1 dust of any variety per turn."
      " Works well with risk reward variety of hero,"
      "Does 1d6 damage to turn to self and each enemy within 20 ft."
      " Hero takes increasing damage each turn, but, nearby enemies share in the pain."
      " Minions ignore this damage, but to all others it is unblockable."
      " Dust mutators – Shadow gives the chance to blind enemies. "
      "Lightning gives a chance to stun enemies. "
      "Fire, gives a chance to ignite nearby enemies as well as yourself, "
      "doubling the damage each turn to each, enemies ignite for 3 turns. "
      "Ice chance to slow enemies, slow their combo rating by 1 per stack, "
      "if combo rating reaches 0 they lose 1 turn and remain at the low end of combo"
      " rating for the remainder of the fight."));
  semblanceList.add(Semblance('Glyphs', "A support skill on will skill that requires"
      " 2 dust to use, can be used on yourself as well, "
      "used to speed all allies movement speed as well as their combo rating."
      " Can be used on enemies to inhibit them. "
      "Dust Mutators- Shadow on ally or self, camouflage yourself, "
      "if used after attack they cannot easily be detected by their enemies,"
      " giving the enemy disadvantage over the player and +1 to the player "
      "character’s armor rating. If used prior to their attack, attack from shadow,"
      " gain advantage on your attack, gaining advantage over the enemy"
      " and increasing your attack by +2. Lightning on ally, self or enemy, "
      "increase ally speed by one allowing longer combos, "
      "this speed increase does not cause their combo miss tolerance to change."
      ));
  semblanceList.add(Semblance('Polarity', " A support or a buff, debuff  semebelence"
      ". As a buff, the player may use some of their aura to boost a teammates aura,"
      " allowing them to survive stronger blows, or put back up their aura in emergency situations."
      " Of course nothing comes for free, this buff comes at expense of one’s own aura."
      " After the Aura owner of has made contact with the weapons of a enemy,"
      " they may employ as a dust power."));
  semblanceList.add(Semblance('Telekinesis', "Use 1 dust per round to make attack"
      " with pure telekinetic power.  Dust choice will affect + to bonus damage."
      " Can attack enemies up to a distance of  80 feet. High"
  "damage, Medium High Speed, Medium to hit bonus. + to bonus damage per level of intelligence."
      ));
  semblanceList.add(Semblance('Elementalist', "Use 3 dust per round of usage. "
      "Use the raw power of dust to create a frightening outburst of  pure magical power."
      " Damages all enemies within 4 squares of the user, on a critical failure,"
      " PCs within that range, including the Player will have to roll a save to"
      " avoid taking damage. Attack is Medium speed, High Damage, Medium-high "
      "to hit bonus. + to bonus damage of the type dust being used."));
  semblanceList.add(Semblance('Dustmancer', 'Uses dust as a physical focus for making spell attacks'
      'refer to d20 SRD for spells, follows spell gains of wizard for number of spells known'
      'Cantrips = 1 dust used and each spell at a spell level = level of spell *3 dust'
      'to use higher level version of the spell pay full dust cost of level'
      'damage type of spells will be that of dust used. e.g. a fireball using all ice dust would do ice damage'));
  semblanceList.add(Semblance('Speed', 'Use 1 dust to increase your own weapons speed by one level for one round.'
  ' To hit will remain the same.  The dust will add a plus to damage dependent on the dust used.'));
  semblanceList.add(Semblance('Shadow', ' Use one dust to replace yourself when you move with a shadow image,'
      ' this shadow image will absorb one attack. If fire dust is used the attacker '
      'will take 3 fire damage from striking the image the attack. '
      'If lightining is used they take 2 damage arcing to the two closest enemies, up to 5 squares away.'
      ' If ice is used, make a roll against one another if the player beats the GM, the attacker loses a turn.'
      ' Wind, the attacker is slowed for the next turn, -2 to movement and minus one to its combo rating.'));
  semblanceList.add(Semblance('Duelist', 'Using 1 dust get an enemies undivided attention for three turns.'
      ' Add plus one of elemental type damage to attacks for each turn. '));
  semblanceList.add(Semblance('Enhance Aura', "Use 1 dust to refill an ally’s aura."
      " The player on the receiving end gains 1d8 + int of the caster Aura Points."
      " If fire was used the ally will gain +1 attack damage on their next attack,"
      " If Lightining is used, + 1 to hit for the next attack. "
      "If ice is used +1 to AC for their next round."
      " if Wind is used Gain an additional miss for next combo."));
  semblanceList.add(Semblance('Element Absorbtion', 'Use 2 dust to absorb up to 2d6 damage of a chosen type of dust, choose '
      'one of the four basic types of dust to absorb the attack, at level 5, after absorbing that attack'
      'you may use it to power your next attack, using a bonus of 2d6 at the end of the combo, at level 7 add an additional d6 absorb,'
      'at level 10, you may add that d6 to your combo.'));
  semblanceList.add(Semblance('Bad Luck Charm', 'Within 20 ft of hero, all other heroes and'
      ' enemies incur disadvantage on all attacks and saving throws, using 2 dust '
      'the hero may attack with adavatage, or used as a reaction, may use to get '
      'advantage on a saving throw. '));

  return semblanceList;
}

class Aura{

  String name;
  String description;
  Aura(this.name, this.description);

  Aura.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'description':description,
      };


}
AurasAvailble(){
  List<Aura> aura = new List();
  aura.add(Aura('Juggernaut', "+2 to AC, At level 5 For each time an enemy"
      " misses gain a counter,"
      " Use 5 counters to add +3 damage per attack to the next attack."
      "At level 10 may use 10 counters for round"
      "at level 15 may use 15 counters a round"));
  aura.add(Aura('Rage', '-1 to AC + 10 total Aura points. For each 10 Aura points missing from the '
      'player gain +1 to attack damage per hit, '
      'Stackable up to Five times. At each 5 levels add another stack possible.'));
  aura.add(Aura('Focus', 'No Ac bonus, +5 dust carrying capacity, of each type, per five levels'));
  aura.add(Aura("Can't hit what you can't Touch", "+ 1 to AC, once per battle your"
  " speed allows you to dodge a successful attack."
      " At level 5 every time an enemy critically fails against you recharge that dodge."
      ));
  aura.add(Aura('Dust recharger', '-1 AC after each battle roll a d4,'
      ' add that much + your wisdom modifier add a d4 every 5 levels'));
  return aura;

}

class EquippedItems{
  RemnantItem body;
  RemnantItem back;
  RemnantItem shoes;
  RemnantItem neck = new RemnantItem('Non equipped neck', '', false, false, 0, 4);
  RemnantItem rightHand = new RemnantItem('Non Equipped rh', '', false, false, 0, 5);
  RemnantItem leftHand = new RemnantItem('Non equipped lh', '', false, false, 0, 6);
  EquippedItems(this.body, this.back, this.shoes);


  Map<String, dynamic> toJson() =>
      {
        'body':body.toJson(),
        'back':back.toJson(),
        'shoes':shoes.toJson(),
        'neck':neck.toJson(),
        'rightHand':rightHand.toJson(),
        'leftHand':leftHand.toJson(),
      };

  EquippedItems.fromJson(Map<String, dynamic> json)
  : body = RemnantItem.fromJson(json['body']),
    back = RemnantItem.fromJson(json['back']),
    shoes = RemnantItem.fromJson(json['shoes']),
    neck = RemnantItem.fromJson(json['neck']),
    rightHand = RemnantItem.fromJson(json['rightHand']),
    leftHand = RemnantItem.fromJson(json['leftHand']);


}



class DustPouch{
  int wind;
  int lightning;
  int fire;
  int water;
  int maxDust;
  DustPouch(this.wind, this.lightning, this.fire,this.water, this.maxDust);

  DustPouch.fromJson(Map<String, dynamic> json)
        : wind = json['wind'],
          lightning = json['lightning'],
          fire = json['fire'],
          water = json['water'],
          maxDust = json['maxDust'];

  Map<String, dynamic> toJson() =>
      {
        'wind':wind,
        'lightning':lightning,
        'fire':fire,
        'water':water,
        'maxDust':maxDust,
      };
}

class Skills{
  int acrobatics;
  int animalHandling;
  int athletics;
  int auraSkill;
  int deception;
  int knowledgeDust;
  int grimm;
  int history;
  int insight;
  int intimidation;
  int investigation;
  int nature;
  int perception;
  int performance;
  int persuasion;
  int sleightOfHand;
  int stealth;
  int survival;
  Skills(this.acrobatics, this.animalHandling, this.athletics, this.auraSkill, this.deception, this.knowledgeDust, this.grimm, this.history,
      this.insight, this.intimidation, this.investigation, this.nature, this.perception, this.performance, this.persuasion,
      this.sleightOfHand, this.stealth, this.survival);

  Skills.fromJson(Map<String, dynamic> json)
          : acrobatics = json['acrobatics'],
            animalHandling = json['animalHandling'],
            athletics = json['athletics'],
            auraSkill = json['auraSkill'],
            deception = json['deception'],
            knowledgeDust = json['knowledgeDust'],
            grimm = json['grimm'],
            history = json['history'],
            insight = json['insight'],
            intimidation = json['intimidation'],
            investigation = json['investigation'],
            nature = json['nature'],
            perception = json['perception'],
            performance = json['performance'],
            persuasion = json['persuasion'],
            sleightOfHand = json['sleightOfHand'],
            stealth = json['stealth'],
            survival = json['survival'];


  Map<String, dynamic> toJson() =>
      {
        'acrobatics':acrobatics,
        'animalHandling':animalHandling,
        'athletics':athletics,
        'auraSkill':auraSkill,
        'deception':deception,
        'knowledgeDust':knowledgeDust,
        'grimm':grimm,
        'history':history,
        'insight':insight,
        'intimidation':intimidation,
        'investigation':investigation,
        'nature':nature,
        'persuasion':persuasion,
        'perception':perception,
        'performance':performance,
        'sleightOfHand':sleightOfHand,
        'stealth':stealth,
        'survival':survival

      };

}

class PrimaryStats{
  int str;
  int dex;
  int con;
  int chr;
  int wis;
  int intel;
  int armorRating = 10;
  int playerLevel = 1;
  int exp = 0;
  int initiativeBonus;
  int maxAura = 50;
  int currentAura = 50;
  int tempAura = 0;
  int currentHp = 5;
  int maxHp = 5;

  PrimaryStats(this.str, this.dex, this.con, this.chr, this.intel, this.wis,
      ){
    this.initiativeBonus = figureBonus(this.dex);
    this.maxAura = this.maxAura + this.figureBonus(this.con);
    this.currentAura = this.maxAura;
  }

  PrimaryStats.fromJson(Map<String, dynamic> json)
          : str = json['str'],
            dex = json['dex'],
            con = json['con'],
            chr = json['chr'],
            wis = json['wis'],
            intel = json['intel'],
            armorRating = json['armorRating'],
            playerLevel = json['playerLevel'],
            exp = json['exp'],
            initiativeBonus = json['initiativeBonus'],
            maxAura = json['maxAura'],
            currentAura = json['currentAura'],
            tempAura = json['tempAura'],
            currentHp = json['currentHp'],
            maxHp = json['maxHp'];

  Map<String, dynamic> toJson() =>
      {
        'str':str,
        'dex':dex,
        'con':con,
        'chr':chr,
        'wis':wis,
        'intel':intel,
        'armorRating':armorRating,
        'playerLevel':playerLevel,
        'exp':exp,
        'initiativeBonus':initiativeBonus,
        'maxAura':maxAura,
        'currentAura':currentAura,
        'tempAura':tempAura,
        'currentHp':currentHp,
        'maxHp':maxHp,
      };

  int figureBonus(int a){
    if (a<2){
      return -5;
    }else if(a<4){
      return -4;
    }else if(a<6){
      return -3;
    }else if(a<8) {
      return -2;
    }else if (a<10){
      return -1;
    }else if (a<12){
      return 0;
    }else if (a<14){
      return 1;
    }else if(a<16){
      return 2;
    }else if(a<18){
      return 3;
    }else if (a<20){
      return 4;
    }else if (a<22){
      return 5;
    }else if (a<24){
      return 6;
    }else if (a<26){
      return 7;
    }else if (a<28)
      return 8;
    else if (a<30)
      return 9;
    else
      return 10;
  }
  checkLevel(int exp){
    if (exp<1000){
      this.playerLevel = 1;
    }else if(exp<3000){
      this.playerLevel =2;
    }else if (exp<6000){
      this.playerLevel =3;
    }else if (exp<10000){
      this.playerLevel =4;
    }else if (exp<15000){
      this.playerLevel =5;
    }else if (exp<210000){
      this.playerLevel=6;
    }else if (exp<28000){
      this.playerLevel = 7;
    }else if (exp<36000){
      this.playerLevel = 8;
    }else if (exp < 45000){
      this.playerLevel = 9;
    }else if (exp < 55000){
      this.playerLevel =10;
    }else if (exp < 66000){
      this.playerLevel =11;
    }else if (exp<78000){
      this.playerLevel =12;
    }else if (exp<91000){
      this.playerLevel =13;
    }else if (exp < 105000){
      this.playerLevel =14;
    }else if (exp<120000){
      this.playerLevel =15;
    }else if (exp<136000){
      this.playerLevel=16;
    }else if(exp < 153000){
      this.playerLevel =17;
    }else if (exp < 171000){
      this.playerLevel = 18;
    }else if (exp < 190000){
      this.playerLevel = 19;
    }else{
      this.playerLevel = 20;
    }
  }

}