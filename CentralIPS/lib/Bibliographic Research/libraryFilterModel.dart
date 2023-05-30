import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:equatable/equatable.dart';

export 'libraryFilterModel.dart';

class LibraryFilter extends Equatable {
  final List<BookCategoryEntry> categoriesFilter;

  const LibraryFilter({this.categoriesFilter =  const <BookCategoryEntry>[]});

  LibraryFilter copyWith({List<BookCategoryEntry>? categoriesFilter}){
    return LibraryFilter(categoriesFilter: categoriesFilter ?? this.categoriesFilter);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [categoriesFilter];
}
