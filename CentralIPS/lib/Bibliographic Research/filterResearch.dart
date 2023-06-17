
import 'package:centralips/Bibliographic%20Research/bibliographicResearch.dart';
import 'package:centralips/Bibliographic%20Research/filterOption.dart';
import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

///This widget represents the filter page for the library
class FilterResearch extends StatefulWidget {
  const FilterResearch({Key? key}) : super(key: key);

  @override
  State<FilterResearch> createState() => FilterResearchState();
}

class FilterResearchState extends State<FilterResearch> {
  bool availability = false;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => {Navigator.pop(context)},
                              icon: const Icon(Icons.arrow_back_ios)),
                          const Padding(padding: EdgeInsets.only(left: 90)),
                          const Text(
                            "Filtros",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10, width: 400),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 10),
                        child: Column(
                          children: [
                            BlocBuilder<LibraryFiltersBloc,
                                LibraryFiltersState>(
                              builder: (context, state) {
                                if (state is LibraryFiltersLoaded) {
                                  return Row(
                                    children: [
                                      const Expanded(
                                          child: Text('Disponível',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w900,
                                              ))),
                                      Switch.adaptive(
                                          // thumb color (round icon)
                                          activeColor: Colors.white,
                                          activeTrackColor:
                                              Color.fromRGBO(85, 56, 236, 100),
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor:
                                              Colors.grey.shade400,
                                          splashRadius: 50.0,
                                          // boolean variable value
                                          value:
                                              state.libraryFilter.isAvailable,
                                          // changes the state of the switch
                                          onChanged: (value) {
                                            setState(() {
                                              state.libraryFilter.isAvailable =
                                                  !state.libraryFilter
                                                      .isAvailable;
                                            });
                                            bool updatedAvailability =
                                                state.libraryFilter.isAvailable;
                                            //log("${updatedAvailability} valor do Value");
                                            context
                                                .read<LibraryFiltersBloc>()
                                                .add(
                                                  IsAvailableFilterUpdate(
                                                    isAvailable:
                                                        updatedAvailability,
                                                  ),
                                                );
                                          }),
                                    ],
                                  );
                                } else {
                                  return const Text("Algo correu mal");
                                }
                              },
                            ),
                            const Divider(
                              height: 50,
                              indent: 0,
                              color: Color.fromRGBO(215, 217, 217, 0.612),
                            ),
                            FilterCategoryWidget(),
                            const Divider(
                              height: 50,
                              indent: 0,
                              color: Color.fromRGBO(215, 217, 217, 0.612),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 90))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 56,
            child: SizedBox(
              width: 300,
              child: FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: const Color.fromRGBO(107, 78, 255, 1),
                  onPressed: () {
                    context.read<LibraryFiltersBloc>().add(SearchWithFilters());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                value: context.read<FooterMenuCubit>(),
                                child: const BibliographicResearch(),
                              )),
                    );
                  },
                  child: Text(
                    'Ver Resultados',
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromRGBO(241, 237, 237, 1)),
                  )),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
