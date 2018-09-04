class RemnantItem{
  String name;
  String description;
  bool isEquipped;
  bool isMagical;
  String armorLocation;
  int armorValue;
  int location;
  int amount  = 1;

  RemnantItem(this.name, this.description, this.isEquipped, this.isMagical,
      this.armorValue, this.location){
    this.armorLocation = armorPlacement(this.location);
  }




  String armorPlacement (int a){
    switch(a){
      case 0:
        return "Can't Equip";
        break;
      case 1:
        return 'Body';
        break;
      case 2:
        return 'Back';
        break;
      case 3:
        return 'Shoes';
        break;
      case 4:
        return 'Neck';
        break;
      case 5:
        return 'Right Hand';
        break;
      case 6:
        return 'Left Hand';
        break;
    }
    return "Can't Equip";
  }

  Map<String, dynamic> toJson() =>{
    'name': name,
    'description': description,
    'Equipped': isEquipped,
    'Magical': isMagical,
    'armorLocation': armorLocation,
    'armorValue':armorValue,
    'location': location,
    'amount':amount,
  };

  RemnantItem.fromJson(Map<String, dynamic> json)
    :   name = json['name'],
        description = json['description'],
        isEquipped = json['Equipped'],
        isMagical = json['Magical'],
        armorLocation = json['armorLocation'],
        armorValue = json['armorValue'],
        location = json['location'],
        amount = json['amount'];





}
class StarterItems{
  List<RemnantItem> starters = new List();
  int lien;

  StarterItems(this.starters, this.lien);
}