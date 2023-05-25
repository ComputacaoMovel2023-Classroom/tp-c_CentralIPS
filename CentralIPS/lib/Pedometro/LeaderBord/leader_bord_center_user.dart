import 'package:centralips/Pedometro/LeaderBord/leader_bord_center.dart';
import 'package:centralips/Pedometro/LeaderBord/load/user_data_leaderbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterUser extends StatelessWidget {
  LeaderBordCenterUser(
      {super.key,
      required this.listOfUsersByID,
      required this.listOfUsersSteps});

  Map<String, int> listOfUsersByID = {};
  List<UserDataLeaderbord> listOfUsersSteps;

  List<LeaderBordCenter> _setUser() {
    //get the user id with firabae auth

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    //search the user in the list
    int place = listOfUsersByID[uid] ?? 0;

    //search the user in the list
    List<LeaderBordCenter> list = [];
    for (int i = 0; i < listOfUsersSteps.length; i++) {
      if (i == place) {
        list.add(LeaderBordCenter(
          placeNumber: "${i + 1}º",
          urlImage: listOfUsersSteps[i].urlImage,
          name: listOfUsersSteps[i].name,
          steps: listOfUsersSteps[i].steps.toString(),
          //exit the loop
        ));
        break;
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    _setUser();
    return Column(
      children: _setUser(),
    );
  }
}
