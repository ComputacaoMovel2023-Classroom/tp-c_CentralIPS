import 'dart:developer';

import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookCategory.dart';

class FilterCategoryWidget extends StatefulWidget {
  FilterCategoryWidget({Key? key}) : super(key: key);

  @override
  State<FilterCategoryWidget> createState() => _FilterCategoryWidgetState();
}

class _FilterCategoryWidgetState extends State<FilterCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryFiltersBloc, LibraryFiltersState>(
      builder: (context, state) {
        if (state is LibraryFiltersLoading) {
          return SizedBox(
            width: double.infinity,
            child: CircularProgressIndicator(),
          );
        }

        if (state is LibraryFiltersLoaded) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: state.libraryFilter.categoriesFilter.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.libraryFilter.categoriesFilter[index]
                                      .category.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor:
                                    const Color.fromRGBO(85, 56, 236, 100),
                                value: state.libraryFilter
                                    .categoriesFilter[index].isEnabled,
                                onChanged: (bool? value) {
                                  BookCategoryEntry aux = BookCategoryEntry(
                                    state.libraryFilter.categoriesFilter[index]
                                        .category,
                                    isEnabled: !state.libraryFilter
                                        .categoriesFilter[index].isEnabled,
                                  );

                                  context.read<LibraryFiltersBloc>().add(
                                        BookCategoryFilterUpdate(
                                            bookCategory: aux),
                                      );
                                },
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        } else {
          return Text("Algo correu mal");
        }
      },
    );
  }
}
