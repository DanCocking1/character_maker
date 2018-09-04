class Feats{
  String name;
  String requirements;
  String description;

  Feats(this.name, this.requirements, this.description);

  Feats.fromJson(Map<String, dynamic> json)
        :     name = json['name'],
              requirements = json['requirements'],
              description = json['description'];

  Map<String, dynamic> toJson() =>
      {
        'name':name,
        'requirements':requirements,
        'description':description
      };



}


AvailableFeats(){
  List<Feats> _avail = new List();
  _avail.add(Feats('Athletic', 'none', 'add +2 to all atheletics and acrobatics checks'));
  _avail.add(Feats('Augment Summoning', 'Spell Focus', 'Each creature you conjure with any '
      'summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it.'));
  _avail.add(Feats('Blind Fighting', 'Str 13, Dex 13',
      'Do not have disadvantage to hit invisible foes'));
  _avail.add(Feats('Brew Potion', 'Int 13 at least lvl 3', 'Can Create one potion of normal level or lower, Time taken to brew '
      '= 1 hour per 50 Lien cost - (lvl - 3) * 3'));
  _avail.add(Feats('Cleave', 'Str 13, Power Attack', 'If you lower an enemy to 0 hit points you may'
      ' make an attack on a second enemy within melee range once per round'));
  _avail.add(Feats('Combat Casting', 'int 13, Dustmancer', 'Advantage on concetration checks for spells'));
  _avail.add(Feats('Combat Expertise', 'int 13', 'When you attack in melee, you may take a penalty as much as -5 to attack, get that amount added to your AC for the next round '));
  _avail.add(Feats('Combat Reflexes', 'Dex 14', 'You may make attacks of oppurtunity equal to your dex bonus per round'));
  _avail.add(Feats('Decetiful', 'Chrasima 13', 'Advantage on deception checks'));
  _avail.add(Feats('Deft Hands', 'Dex 12', '+2 bonus on all sleight of hand checks'));
  _avail.add(Feats('Improved Deft Hands', 'Deft Hands', 'Advantage on all sleight of hands checks'));
  _avail.add(Feats('Diehard', 'Con 12', 'The first time you lose your aura, regain one Aura point, Hit points are not charged for this one hit'));
  _avail.add(Feats('Dodge', 'Dex 14', 'As a reaction make an enemy attempt to hit you with disadvantage, if hit take half damage'));
  _avail.add(Feats('Endurance', 'Con 12', 'Gain advantage on all rolls to see if character has suffered exhaustion'));
  _avail.add(Feats('Eschew Dust', 'Int 12', 'Once per encounter you may reduce the dust cost of a spell or semblance skill by 4 or less'));
  _avail.add(Feats('Far Shot', 'Point Blank Shot', 'No disadvantge for weapons range + 50% of its range'));
  _avail.add(Feats('Great Cleave', 'Cleave, Str 13, base attack +4', 'Cleave may be used as many times as possible per round.'));
  _avail.add(Feats('Great Fortitude', 'none', 'Advantage on Constitution saving throws'));
  _avail.add(Feats('Greater Spell Focus', 'Spell focus', 'Add +1 to DC for opponents saving throws for magic of a given Dust type'));
  _avail.add(Feats('Greater Weapon Focus', 'Weapon Focus', "+1 to all attack rolls with your named weapon, this stacks with weapon focus"));
  _avail.add(Feats('Greater Weapon Specialization', 'Greater Weapon Focus at least lvl 12', '+2 bonus damage to all successful hits in a combo'));
  _avail.add(Feats('Heightened Spell', 'none', 'Once per encounter you may use you may use your semblance at damage one level higher'));
  _avail.add(Feats('Improved Bull Rush', 'Bull Rush Str 13', 'When you perform a bull rush you do not provoke an attack of oppurtunity, advatage on the strength check opposed to push back.'));
  _avail.add(Feats('Improved Critical', '+8 bonus attack', '19 is a critical hit, as long as it hit the opponents AC'));
  _avail.add(Feats('Improved Disarm', 'Int 13, Combat Expertise', 'Advantage when you attempt to disarm an opponent, they do not get a chance to disarm you on a fail'));
  _avail.add(Feats('Improved Intiative', 'None', 'Advantage on intiative'));
  _avail.add(Feats('Improved Precise Shot', 'Dex 19, Point Blank Shot, Precise Shot', 'Ignore cover bonus of opponents on ranged attacks'));
  _avail.add(Feats('Improved Sunder', 'Str 13, Power Attack', 'Attacks on items held or carried by opponent gain advantage'));
  _avail.add(Feats('Improved trip', 'int 13, Combat expertise', 'As an action, with advatage, you may attempt to trip an opponent, knocking tham prone, on succes apply a 2 hit combo to the opponent'));
  _avail.add(Feats('Improved Investigation', 'none', '+2 on Investigation and perception checks'));
  _avail.add(Feats('Iron Will', 'None', 'Advantage on Charisma Saving throws'));
  _avail.add(Feats('Lightning Reflexes', 'none', 'Advantage on Dex saving throws'));
  _avail.add(Feats('Mobility', 'Dodge, Dex 13', 'Opponents take attacks of oppurtunity at disadvantage'));
  _avail.add(Feats('Negotiator', 'none', '+2 bonus to Persuasion and insight checks'));
  _avail.add(Feats('Nimble Fingers', 'none', 'Checks to pick locks and disarm traps get +2'));
  _avail.add(Feats('Persuasive', 'none', '+2 to persuasion and intimidate checks'));
  _avail.add(Feats('Point Blank Shot', 'none', '+1 attack and damage when using ammo at ranges up to 30 feet'));
  _avail.add(Feats('Power Attack', 'Str 13', 'You may take a penalty on your attack roll of up to your base attack, add this to your damage rolls'));
  _avail.add(Feats('Run', 'Light or Medium Armor, not overencumbered', 'You may use your action and movement to move at 4 times speed for one turn, Jumps made while running are done at advantage'));
  _avail.add(Feats('Self Suffcient', 'None', '+2 to survival and nature checks'));
  _avail.add(Feats('Skill Focus', 'none, this feat is repeatable', '+3 bonus to a skill of choice'));
  _avail.add(Feats('Spell Focus', 'none', '+1 Difficulty to all saving throws of a chosen dust variety'));
  _avail.add(Feats('Stealthy', 'none', '+2 to stealth and deception checks'));
  _avail.add(Feats('Toughness', 'none', 'You gain 1d6 hitpoints, you may take this multple times'));
  _avail.add(Feats('Weapon Focus', 'Base attack +1', 'Gain a +1 to attack rolls'));
  _avail.add(Feats('Weapon Specialization', 'Weapon Focus', '+2 to damage rolls'));
  _avail.add(Feats('Whirlwind Attack', 'Dex 13, int 13, Dodge, Mobility, base attack bonus +4', 'Once per encounter, you may make one attack against all enemies in melee Range, instead of your regular attack'));
  return _avail;
}