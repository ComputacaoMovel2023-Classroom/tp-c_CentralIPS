part of 'library_filters_bloc.dart';

abstract class LibraryFiltersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LibraryFiltersLoading extends LibraryFiltersState {}

class LibraryFiltersLoaded extends LibraryFiltersState {
  LibraryFilter libraryFilter;

  LibraryFiltersLoaded({this.libraryFilter = const LibraryFilter()});

  @override
  List<Object?> get props => [libraryFilter];
}
