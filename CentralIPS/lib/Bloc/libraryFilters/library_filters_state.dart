part of 'library_filters_bloc.dart';

abstract class LibraryFiltersState extends Equatable {
  const LibraryFiltersState();
  @override
  List<Object?> get props => [];
}

class LibraryFiltersLoading extends LibraryFiltersState {}

class LibraryFiltersLoaded extends LibraryFiltersState {
  final LibraryFilter libraryFilter;

  const LibraryFiltersLoaded({this.libraryFilter = const LibraryFilter()});

  @override
  List<Object?> get props => [libraryFilter];
}
