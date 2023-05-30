import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:centralips/register_page/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:centralips/WelcomeScreen/welcome_screen.dart';
import 'Sidebar/NavBar.dart';
import 'Cubit/index_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyAppDemo());
}

class MyAppDemo extends StatelessWidget {
  const MyAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LibraryFiltersBloc()
        ..add(LibraryFilterLoad()),
        child: MaterialApp(
          title: 'CentralIPS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: WelcomeScreen(),
        ));
  }
}
