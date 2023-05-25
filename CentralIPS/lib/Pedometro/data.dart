import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import 'day.dart';

/*
final dataa = [
  DayAgo("Seg", 2200),
  DayAgo("Ter", 3500),
  DayAgo("Qua", 500),
  DayAgo("Qui", 4000),
  DayAgo("Sex", 2500),
];
*/
class DataStepsDay {
  // get info from database

  static Future<void> getSteps(
      List<DayAgo> dataSteps, Function onUpdateUI) async {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref('ipshealth/${user!.uid}');

    userRef.onValue.listen((DatabaseEvent event) {
      dataSteps.clear();
      final data = event.snapshot.value as Map;

      //cicle for 5 times
      for (int i = 5; i > 0; i--) {
        // get date
        var now = DateTime.now();
        var formatter = DateFormat('yyyy-MM-dd');
        String formattedDate =
            formatter.format(now.subtract(Duration(days: i)));

        // get steps
        int steps = data[formattedDate] ?? 0;

        //erase the year from formattedDate
        formattedDate = formattedDate.substring(5);

        // add to list
        dataSteps.add(DayAgo(formattedDate, steps));
      }

      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);

      //if the day is not in the database, add it
      if (data[formattedDate] != null) {
        //remove the first element
        dataSteps.removeAt(0);
        dataSteps.add(DayAgo(formattedDate.substring(5), data[formattedDate]));
      }
      print(dataSteps);

      //update UI
      onUpdateUI();
    });
  }
}
