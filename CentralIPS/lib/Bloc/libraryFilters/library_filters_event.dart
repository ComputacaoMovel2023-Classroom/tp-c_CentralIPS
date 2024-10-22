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

class IsAvailableFilterUpdate extends LibraryFiltersEvent {
  final bool isAvailable;

  const IsAvailableFilterUpdate({required this.isAvailable});
  
  @override
  List<Object?> get props => [isAvailable];
}

class SearchWithFilters extends LibraryFiltersEvent {

  const SearchWithFilters();
  
  @override
  List<Object?> get props => [];
}

