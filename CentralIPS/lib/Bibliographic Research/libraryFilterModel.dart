import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:equatable/equatable.dart';

export 'libraryFilterModel.dart';

class LibraryFilter extends Equatable {
  final List<BookCategoryEntry> categoriesFilter;
  bool isAvailable;
  final bool performFilterSearch;

  LibraryFilter(
      {this.categoriesFilter = const <BookCategoryEntry>[],
      this.isAvailable = false,
      this.performFilterSearch = false});

  LibraryFilter copyWith(
      {List<BookCategoryEntry>? categoriesFilter,
      bool? isAvailable,
      bool? performFilterSearch}) {
    return LibraryFilter(
      categoriesFilter: categoriesFilter ?? this.categoriesFilter,
      isAvailable: isAvailable ?? this.isAvailable,
      performFilterSearch: performFilterSearch ?? this.performFilterSearch,
    );
  }

  @override
  List<Object?> get props => [categoriesFilter];
}
