part of 'library_filters_bloc.dart';


abstract class LibraryFiltersEvent extends Equatable {
  const LibraryFiltersEvent();
  @override
  List<Object?> get props => [];
}

class LibraryFilterLoad extends LibraryFiltersEvent {
  @override
  List<Object?> get props => [];
}

class BookCategoryFilterUpdate extends LibraryFiltersEvent {
  final BookCategoryEntry bookCategory;

  const BookCategoryFilterUpdate({required this.bookCategory});
  
  @override
  List<Object?> get props => [bookCategory];
}
