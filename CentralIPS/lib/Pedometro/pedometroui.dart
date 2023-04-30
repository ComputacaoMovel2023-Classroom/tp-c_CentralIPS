import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../Sidebar/NavBar.dart';
import 'data.dart';
import 'day.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Pedometro extends StatefulWidget {
  const Pedometro({super.key});

  @override
  _PedometroState createState() => _PedometroState();
}

class _PedometroState extends State<Pedometro> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  int stepsGoal = 1;
  int calorieGoal = 1;
  @override
  Widget build(BuildContext context) {
    PermissionStatus result;
    // In Android we need to request the storage permission,
    // while in iOS is the photos permission

    Permission.activityRecognition.request();

    double dsteps =
        double.tryParse(_steps) != null ? double.parse(_steps) * 0.04 : 0.0;

    return Stack(
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
        Scaffold(
          //bottomNavigationBar: const BottomNavigationExample(),
          resizeToAvoidBottomInset: false,
          drawer: const NavBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: const <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/moura.jpg'),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        "Pedro Moura",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 150.0,
                          child: CircularPercentIndicator(
                            radius: 80.0,
                            animation: true,
                            animationDuration: 1000,
                            lineWidth: 15.0,
                            percent: double.tryParse(_steps) == null
                                ? 0
                                : double.parse(_steps) > stepsGoal
                                    ? 1
                                    : double.parse(_steps) / stepsGoal,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(padding: EdgeInsets.all(0)),
                                Text(
                                  _steps,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.directions_walk,
                                  size: 30,
                                ),
                                /*Image.asset(
                                  'assets/images/512x512.png',
                                  height: 50, // set the height of the image
                                ),*/
                                Text(
                                  "$stepsGoal",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor:
                                const Color.fromARGB(255, 106, 105, 102),
                            progressColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 120.0,
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            animation: true,
                            animationDuration: 1000,
                            lineWidth: 15.0,
                            percent: double.tryParse(_steps) == null
                                ? 0
                                : double.parse(_steps) * 0.04 > calorieGoal
                                    ? 1
                                    : double.parse(_steps) * 0.04 / calorieGoal,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(padding: EdgeInsets.all(0)),
                                Text(
                                  double.tryParse(_steps) != null
                                      ? (double.parse(_steps) * 0.04)
                                          .toStringAsFixed(2)
                                      : '0.0',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.local_fire_department,
                                  size: 30,
                                ),
                                /*Image.asset(
                                  'assets/images/512x512.png',
                                  height: 50, // set the height of the image
                                ),*/
                                Text(
                                  calorieGoal.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor:
                                const Color.fromARGB(255, 106, 105, 102),
                            progressColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFffffff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                              width: 150.0,
                              child: TextButton.icon(
                                onPressed: () {
                                  showMaterialNumberPicker(
                                    headerColor: Colors
                                        .blue, // background color of the header area
                                    headerTextColor: const Color(
                                        0xFFFFFFFF), // text fcolor of the header
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255), // background color of the entire dialog
                                    buttonTextColor: const Color.fromARGB(
                                        255,
                                        0,
                                        0,
                                        0), // text color of the action bar buttons
                                    context: context,
                                    title: 'Objetivo diário de passos?',
                                    maxNumber: 30000,
                                    minNumber: 1000,
                                    step: 500,
                                    selectedNumber: stepsGoal,
                                    onChanged: (value) =>
                                        setState(() => stepsGoal = value),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 18),
                                label: const Text("Objetivo de Passos"),
                              )),
                          SizedBox(
                              width: 120.0,
                              child: TextButton.icon(
                                onPressed: () {
                                  showMaterialNumberPicker(
                                    headerColor: Colors
                                        .blue, // background color of the header area
                                    headerTextColor: const Color(
                                        0xFFFFFFFF), // text fcolor of the header
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255), // background color of the entire dialog
                                    buttonTextColor: const Color.fromARGB(
                                        255,
                                        0,
                                        0,
                                        0), // text color of the action bar buttons
                                    context: context,
                                    title: 'Objetivo diário de calorias?',
                                    maxNumber: 2000,
                                    minNumber: 200,
                                    step: 100,
                                    selectedNumber: calorieGoal,
                                    onChanged: (value) =>
                                        setState(() => calorieGoal = value),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 18),
                                label: const Text("Objetivo de Calorias"),
                              ))
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    const Text(
                      "Progresso Semanal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: 200,
                        child: charts.BarChart(
                          [
                            charts.Series<DayAgo, String>(
                              id: 'Days',
                              colorFn: (_, __) =>
                                  charts.MaterialPalette.blue.shadeDefault,
                              domainFn: (DayAgo day, _) => day.day,
                              measureFn: (DayAgo day, _) => day.steps,
                              data: data,
                            ),
                          ],
                          animate: true,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
