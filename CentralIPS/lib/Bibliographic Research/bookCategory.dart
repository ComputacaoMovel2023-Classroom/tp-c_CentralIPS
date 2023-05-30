import 'package:equatable/equatable.dart';

/**
 * Book category
 */
enum BookCategory { accao, aventura, biografias, conto, drama, romances, terror, na }

extension CategoryExtension on BookCategory {
  String get name {
    switch (this) {
      case BookCategory.accao:
        return 'Acção';
      case BookCategory.aventura:
        return 'Aventura';
      case BookCategory.biografias:
        return 'Biografias';
      case BookCategory.conto:
        return 'Conto';
      case BookCategory.drama:
        return 'Drama';
      case BookCategory.romances:
        return 'Romances';
      case BookCategory.terror:
        return 'Terror';
      case BookCategory.na:
        return 'NA';
      default:
        return '';
    }
  }


}

class BookCategoryEntry extends Equatable{
  final BookCategory category;
  bool isEnabled;

  BookCategoryEntry(this.category, {this.isEnabled = false});
  
  @override
  List<Object?> get props => [category,isEnabled];
}


List<String> getCategoryNames() {
  return BookCategory.values.map((category) => category.name).toList();
}

BookCategory getCategory(String string){

  switch(string){
    case "Category.accao" : return BookCategory.accao;
case "Category.aventura" : return BookCategory.aventura;
    case "Category.biografias" : return BookCategory.biografias;
    case "Category.conto" : return BookCategory.conto;
    case "Category.drama" : return BookCategory.drama;
    case "Category.romances" : return BookCategory.romances;
    case "Category.terror" : return BookCategory.terror;
    default: return BookCategory.na;
  }

}