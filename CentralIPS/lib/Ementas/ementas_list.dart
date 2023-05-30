import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:centralips/Ementas/ementas_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EmentasList extends StatefulWidget {
  EmentasList({
    required this.type,
    Key? key,
  }) : super(key: key);

  final String type;
  @override
  State<EmentasList> createState() => _EmentasListState();
}

class _EmentasListState extends State<EmentasList> {
  List<DailyEmenta> weekdayMeals = [
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...'),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...'),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...'),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...'),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...'),
  ];

  final List<String> diasSemana = [
    'segunda-feira',
    'terça-feira',
    'quarta-feira',
    'quinta-feira',
    'sexta-feira'
  ];
  bool _isDisposed = false;
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child(widget.type);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      var barmeals = snapshot.value as Map;
      //print('noticiasData: $noticiasData');

      List<DailyEmenta> updatedDailyEmenta = [];
      barmeals.forEach((key, value) {
        DailyEmenta dailyEmenta = DailyEmenta(
          date: value['date'] ?? '01/01',
          sopa: value['sopa'] ?? 'Sopa',
          peixe: value['peixe'] ?? 'Peixe',
          carne: value['carne'] ?? 'Carne',
          vegetariano: value['vegetariano'] ?? 'Vegetariano',
        );
        updatedDailyEmenta.add(dailyEmenta);
      });
      if (!_isDisposed) {
        setState(() {
          weekdayMeals = updatedDailyEmenta;
        });
      }
    });
    //print('TAMANHO ARRAY: ${weekdayMeals.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(23),
                    child: SizedBox(
                      width: 355,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
                itemCount: diasSemana.length,
                itemBuilder: (context, index) {
                  // print('weekdayMeals: ${weekdayMeals.length}}');

                  return EmentasListItem(
                    icon: Icons.restaurant,
                    weekday: diasSemana[index],
                    weekdayMeals: weekdayMeals[index],
                  );
                },
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
