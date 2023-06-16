import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_list_item.dart';
import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:centralips/Ementas/ementas_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AdminEmentasList extends StatefulWidget {
  AdminEmentasList({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;
  @override
  State<AdminEmentasList> createState() => _AdminEmentasListState();
}

class _AdminEmentasListState extends State<AdminEmentasList> {
  List<DailyEmenta> weekdayMeals = [
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...',
        index: 0),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...',
        index: 1),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...',
        index: 2),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'AMDRE',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...',
        index: 3),
    DailyEmenta(
        date: '01/01/2021',
        sopa: 'A carregar...',
        peixe: 'A carregar...',
        carne: 'A carregar...',
        vegetariano: 'A carregar...',
        index: 4),
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

      List<DailyEmenta> updatedDailyEmenta = [];
      barmeals.forEach((key, value) {
        DailyEmenta dailyEmenta = DailyEmenta(
          date: value['date'] ?? '01/01',
          sopa: value['sopa'] ?? 'Sopa',
          peixe: value['peixe'] ?? 'Peixe',
          carne: value['carne'] ?? 'Carne',
          vegetariano: value['vegetariano'] ?? 'Vegetariano',
          index: value['index'] ?? 0,
        );

        weekdayMeals[dailyEmenta.index] = (dailyEmenta);
      });
      if (!_isDisposed) {
        setState(() {
          weekdayMeals;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                itemBuilder: (_, index) {
                  int index2 = index % diasSemana.length;

                  return AdminEmentasListItem(
                    onRefresh: () => _fetchData(),
                    icon: Icons.restaurant,
                    weekday: diasSemana[index2],
                    weekdayMeals: weekdayMeals[index2],
                    type: widget.type,
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
