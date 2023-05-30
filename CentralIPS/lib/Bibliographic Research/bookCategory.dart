import 'package:equatable/equatable.dart';

/// Book category
enum BookCategory {
  accao,
  aventura,
  biografias,
  conto,
  drama,
  romances,
  terror,
  na
}

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

class BookCategoryEntry extends Equatable {
  final BookCategory category;
  bool isEnabled;

  BookCategoryEntry(this.category, {this.isEnabled = false});

  @override
  List<Object?> get props => [category, isEnabled];
}

List<String> getCategoryNames() {
  return BookCategory.values.map((category) => category.name).toList();
}

BookCategory getCategory(String string) {
  switch (string) {
    case "BookCategory.accao":
      return BookCategory.accao;
    case "BookCategory.aventura":
      return BookCategory.aventura;
    case "BookCategory.biografias":
      return BookCategory.biografias;
    case "BookCategory.conto":
      return BookCategory.conto;
    case "BookCategory.drama":
      return BookCategory.drama;
    case "BookCategory.romances":
      return BookCategory.romances;
    case "BookCategory.terror":
      return BookCategory.terror;
    default:
      return BookCategory.na;
  }
}

BookCategory getCategoriesByName(String string) {
  switch (string) {
    case "Acção":
      return BookCategory.accao;
    case "Aventura":
      return BookCategory.aventura;
    case "Biografias":
      return BookCategory.biografias;
    case "Conto":
      return BookCategory.conto;
    case "Drama":
      return BookCategory.drama;
    case "Romances":
      return BookCategory.romances;
    case "Terror":
      return BookCategory.terror;
    default:
      return BookCategory.na;
  }
}
