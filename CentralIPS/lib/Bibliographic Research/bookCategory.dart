/**
 * Book category
 */
enum Category { accao, aventura, biografias, conto, drama, romances, terror, na }

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.accao:
        return 'Acção';
      case Category.aventura:
        return 'Aventura';
      case Category.biografias:
        return 'Biografias';
      case Category.conto:
        return 'Conto';
      case Category.drama:
        return 'Drama';
      case Category.romances:
        return 'Romances';
      case Category.terror:
        return 'Terror';
      case Category.na:
        return 'NA';
      default:
        return '';
    }
  }

  String displayString() => name;
  
}
List<String> getCategoryNames() {
  return Category.values.map((category) => category.name).toList();
}