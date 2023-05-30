import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:centralips/WelcomeScreen/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyAppDemo()));
  runApp(const MyAppDemo());
}

class MyAppDemo extends StatelessWidget {
  const MyAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LibraryFiltersBloc()..add(LibraryFilterLoad()),
        child: MaterialApp(
          title: 'CentralIPS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
        ));
  }
}
