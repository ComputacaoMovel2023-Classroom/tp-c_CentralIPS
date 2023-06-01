import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:equatable/equatable.dart';

export 'libraryFilterModel.dart';

class LibraryFilter extends Equatable {
  final List<BookCategoryEntry> categoriesFilter;
  final bool isAvailable;

  const LibraryFilter({this.categoriesFilter = const <BookCategoryEntry>[], this.isAvailable = false});

  LibraryFilter copyWith({List<BookCategoryEntry>? categoriesFilter, bool? isAvailable}) {
    return LibraryFilter(
        categoriesFilter: categoriesFilter ?? this.categoriesFilter,
        isAvailable: isAvailable ?? this.isAvailable);
  }

  @override
  List<Object?> get props => [categoriesFilter];
}
