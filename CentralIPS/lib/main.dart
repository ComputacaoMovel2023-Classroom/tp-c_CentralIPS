import 'dart:developer';

import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:centralips/WelcomeScreen/welcome_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = AppBlocObserver();

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

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("onblocevent${bloc.runtimeType}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("onBlocError${bloc.runtimeType}");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log("onBlocClose${bloc.runtimeType}");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("onBlocChange${bloc.runtimeType}");

    super.onChange(bloc, change);
  }
}
