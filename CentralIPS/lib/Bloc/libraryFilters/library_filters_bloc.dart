import 'package:bloc/bloc.dart';
import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Bibliographic%20Research/libraryFilterModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'library_filters_event.dart';
part 'library_filters_state.dart';

class LibraryFiltersBloc
    extends Bloc<LibraryFiltersEvent, LibraryFiltersState> {
  LibraryFiltersBloc() : super(LibraryFiltersLoading());
  
  @override
  Stream<LibraryFiltersState> mapEventToState(
      LibraryFiltersEvent event) async* {
    if (event is LibraryFilterLoad) {
      yield* _mapFilterLoadToState();
    }
    if (event is BookCategoryFilterUpdate) {
      yield* _mapBookCategoryFilterUpdatedToState(event, state);
    }
  }

  Stream<LibraryFiltersState> _mapFilterLoadToState() async* {
    yield LibraryFiltersLoaded(
        libraryFilter: LibraryFilter(
            categoriesFilter:
                BookCategory.values.map((e) => BookCategoryEntry(e)).toList()));
  }

  Stream<LibraryFiltersState> _mapBookCategoryFilterUpdatedToState(
      BookCategoryFilterUpdate event, LibraryFiltersState state) async* {
    if (state is LibraryFiltersLoaded) {
      final List<BookCategoryEntry> updatedBookCategoryFilters =
          state.libraryFilter.categoriesFilter.map((bookCategory) {
        return bookCategory.isEnabled == event.bookCategory.isEnabled
            ? event.bookCategory
            : bookCategory;
      }).toList();

      yield LibraryFiltersLoaded(
          libraryFilter:
              LibraryFilter(categoriesFilter: updatedBookCategoryFilters));
    }
  }
}
