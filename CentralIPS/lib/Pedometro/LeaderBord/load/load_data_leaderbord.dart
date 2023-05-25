import 'package:centralips/Pedometro/LeaderBord/load/user_data_leaderbord.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class LoadDataLeaderbord {
  static void loadData(List<UserDataLeaderbord> listOfUsersData,
      Map<String, int> listOfUsersSteps, Function onUpdateUI) {
    //firebase
    DatabaseReference userRef = FirebaseDatabase.instance.ref('ipshealth');

    userRef.onValue.listen((DatabaseEvent event) {
      //create the map
      listOfUsersSteps.clear();
      //clear the map

      //get the users with the most steps
      final data = event.snapshot.value as Map;

      //cilde for calculate the steps of each user
      for (var user in data.entries) {
        //get the current month
        var now = DateTime.now();
        var formatter = DateFormat('MM-yyyy');
        String correntMonth = formatter.format(now).substring(0, 2);
        String currentYear = formatter.format(now).substring(3, 7);
        //get the steps of each user
        int steps = 0;
        for (var day in user.value.entries) {
          //chec if the year is the same

          if (day.key.substring(5, 7) == correntMonth &&
              day.key.substring(0, 4) == currentYear) {
            steps += day.value as int;
          }
        }
        //add to the map
        listOfUsersSteps[user.key] = steps;
      }

      //sort the map by the steps
      listOfUsersSteps = Map.fromEntries(listOfUsersSteps.entries.toList()
        ..sort((e1, e2) => e2.value - e1.value));

      print(listOfUsersSteps);

      saveData(listOfUsersData, listOfUsersSteps, onUpdateUI);
    });
  }

  //method to save in a list the name, steps and foto of the user by the map listOfUsersSteps
  static void saveData(List<UserDataLeaderbord> listOfUsersData,
      Map<String, int> listOfUsersSteps, Function onUpdateUI) {
    listOfUsersData.clear();
    //for each user in the map
    //get the name, steps and foto
    //add to the list
    //update UI

    for (var user in listOfUsersSteps.entries) {
      //get the name and foto from realtime database
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref('users/${user.key}');

      userRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value as Map;
        //get user name from data
        String name = data['name'] ?? 'User';
        String photo = data['photo'] ??
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";
        listOfUsersData.add(
            UserDataLeaderbord(name: name, steps: user.value, urlImage: photo));

        //sort the list by the steps
        listOfUsersData.sort((a, b) => b.steps.compareTo(a.steps));

        onUpdateUI();
      });
    }
  }
}
