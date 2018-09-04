class Weapon {
  String name = '';
  String weaponType;
  String attackSpeed;
  int hitBonus;
  int damageClass;
  int damageBonus;
  int weaponRange;
  String damageClassDescriptor;
  String notes;
  Weapon( this.weaponType, this.attackSpeed,
      this.hitBonus, this.damageClass, this.damageBonus, this.weaponRange,
      this.notes){
        this.damageClassDescriptor = getDamageClassDescriptor(this.damageClass);
  }

  Weapon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        weaponType = json['weaponType'],
        attackSpeed = json['attackSpeed'],
        hitBonus = json['hitBonus'],
        damageClass = json['damageClass'],
        damageBonus = json['damageBonus'],
        weaponRange = json['weaponRange'],
        notes = json['notes'];

  Map<String, dynamic> toJson()=>
  {
    'name':name,
    'weaponType':weaponType,
    'attackSpeed':attackSpeed,
    'hitBonus':hitBonus,
    'damageClass':damageClass,
    'damageBonus':damageBonus,
    'weaponRange':weaponRange,
    'damageClassDescriptor':damageClassDescriptor,
    'notes':notes,

  };

  String getDamageClassDescriptor(int a){
    if (a <3){
      return 'very low';
    }else if(a <5 ){
      return 'low';
    }else if (a<7){
      return 'Medium Low';
    }else if (a<9){
      return 'Medium';
    }else if (a<11)
    return 'Medium High';
    else if (a<13)
      return 'High';
    else if (a<21)
      return 'Extremly High';
    else
      return 'error';
  }
}


List availableWeapons(){
  List<Weapon> weaponsToBeEquipped = new List();
  weaponsToBeEquipped.add(new Weapon('Scythe/Sniper Rifle', 'High',
      -1, 12, 1, 100, "+40 Movement on combo"));
  weaponsToBeEquipped.add(new Weapon('Sword/Gunsword', 'High', 2, 8, 2, 20,
      "+20 movement"));
  weaponsToBeEquipped.add(new Weapon("Sword and Shield", 'medium/low', 0, 8, 0, 20,
      '+2 ac'));
  weaponsToBeEquipped.add(Weapon('Gauntlet/Shotgun', 'high', 3, 4, 3, 10,
      '+30 Movement, Double if attack skipped'));
  weaponsToBeEquipped.add(Weapon('Hammer/Rocket Launcher', 'low', 3, 12, 4, 50,
      'Can upgrade speed at higher levels no movement bonus'));
  weaponsToBeEquipped.add(Weapon('Bow/Nunchuck/Shotgun', 'medium', 2, 8, 2, 20,
      'Fast, 1, 6, 2, 10 in transformed + 50 movement in staff form'));
  weaponsToBeEquipped.add(Weapon('Chained Blade/pistol', 'high', 1, 8, 1, 50,
      '+20 Movement Speed'));
  weaponsToBeEquipped.add(Weapon('Dual Pistol, Dagger', 'high', 2, 4, 2, 50,
      '+30 Movement'));
  weaponsToBeEquipped.add(Weapon('Cane/Short Sword/ Grenade Launcher', 'slow ',
      3, 4, 2, 50, '+10 damage on full combo + 20 Movement'));
  weaponsToBeEquipped.add(Weapon('Bat/Thermos/Grenade Launcher', 'Medium/Low ',
      2, 10, 2, 50, '+ 10 Movement'));
  weaponsToBeEquipped.add(Weapon('Axe Blunerbuss', 'Low', 3, 12, 3, 50,
      '+10 Movement Speed'));
  weaponsToBeEquipped.add(Weapon('Wand', 'low', 3, 4, 1, 50,
      "No Ammo, Double Carrying capacity for dust"));
  weaponsToBeEquipped.add(Weapon('Case/Minigun', 'high', 0, 2, 1, 100,
      'On 5 hit combo does +20 damage'));

  return weaponsToBeEquipped;

}