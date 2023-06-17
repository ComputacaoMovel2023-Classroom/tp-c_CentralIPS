
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Bibliographic%20Research/libraryFilterModel.dart';
import 'package:equatable/equatable.dart';

part 'library_filters_event.dart';
part 'library_filters_state.dart';

class LibraryFiltersBloc
    extends Bloc<LibraryFiltersEvent, LibraryFiltersState> {
  LibraryFilter libraryFilter = LibraryFilter();

  LibraryFiltersBloc() : super(LibraryFiltersLoading()) {
    on<LibraryFilterLoad>(_mapFilterLoadToState);
    on<BookCategoryFilterUpdate>(_mapBookCategoryFilterUpdatedToState);
    on<IsAvailableFilterUpdate>(_availabilityUpdatedToState);
    on<SearchWithFilters>(_searchWithFiltersUpdatedToState);
  }

  void _mapFilterLoadToState(event, emit) {
    libraryFilter = LibraryFilter(
        categoriesFilter:
            BookCategory.values.map((e) => BookCategoryEntry(e)).toList());
    emit(LibraryFiltersLoaded(
      libraryFilter: libraryFilter,
    ));
  }

  void _mapBookCategoryFilterUpdatedToState(
      BookCategoryFilterUpdate event, emit) {
    if (state is LibraryFiltersLoaded) {
      final List<BookCategoryEntry> updatedBookCategoryFilters =
          libraryFilter.categoriesFilter.map((bookCategory) {
        return bookCategory.category == event.bookCategory.category
            ? event.bookCategory
            : bookCategory;
      }).toList();
      log(updatedBookCategoryFilters.toString());

      libraryFilter = LibraryFilter(
          categoriesFilter: updatedBookCategoryFilters,
          isAvailable: libraryFilter.isAvailable);
      emit(
        LibraryFiltersLoaded(libraryFilter: libraryFilter),
      );
    }
  }

  void _availabilityUpdatedToState(IsAvailableFilterUpdate event, emit) {
    if (state is LibraryFiltersLoaded) {
      //log("${libraryFilter.isAvailable}: valor anterior");
      libraryFilter = LibraryFilter(
          categoriesFilter: libraryFilter.categoriesFilter,
          isAvailable: event.isAvailable);

      //log("${libraryFilter.isAvailable}: valor alterado");

      emit(
        LibraryFiltersLoaded(libraryFilter: libraryFilter),
      );
    }
  }

  void _searchWithFiltersUpdatedToState(SearchWithFilters event, emit) {
    if (state is LibraryFiltersLoaded) {
      libraryFilter = LibraryFilter(
          categoriesFilter: libraryFilter.categoriesFilter,
          isAvailable: libraryFilter.isAvailable,
          performFilterSearch: true);
      emit(LibraryFiltersLoaded(libraryFilter: libraryFilter));
    }
  }
}
