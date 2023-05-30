import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Bibliographic%20Research/libraryFilterModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'library_filters_event.dart';
part 'library_filters_state.dart';

class LibraryFiltersBloc
    extends Bloc<LibraryFiltersEvent, LibraryFiltersState> {
  LibraryFilter libraryFilter = LibraryFilter();

  LibraryFiltersBloc() : super(LibraryFiltersLoading()) {
    on<LibraryFilterLoad>(_mapFilterLoadToState);
    on<BookCategoryFilterUpdate>(_mapBookCategoryFilterUpdatedToState);
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

      emit(
        LibraryFiltersLoaded(
          libraryFilter:
              LibraryFilter(categoriesFilter: updatedBookCategoryFilters),
        ),
      );
    }
  }
}
