import 'package:centralips/Pedometro/LeaderBoard/leader_board_center.dart';
import 'package:centralips/Pedometro/LeaderBoard/load/user_data_leaderboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterUser extends StatelessWidget {
  LeaderBordCenterUser({Key? key, required this.listOfUsersByID})
      : super(key: key);

  Map<String, UserDataLeaderboard> listOfUsersByID;

  LeaderBoardCenter _user = const LeaderBoardCenter(
    placeNumber: "---",
    urlImage:
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
    name: "Eu",
    steps: "0",
  );

  void _setUserCard() {
    //get the user id with firabae auth

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    //search the user in the list
    UserDataLeaderboard? userInfo = listOfUsersByID[uid];

    if (userInfo != null) {
      //get the place number that correpondes of the index of the list
      // sort the list by steps

      List<UserDataLeaderboard> tempList = listOfUsersByID.values.toList();
      tempList.sort((a, b) => b.steps.compareTo(a.steps));

      int placeNumber = tempList.indexOf(userInfo) + 1;

      _user = LeaderBoardCenter(
        placeNumber: "$placeNumberº",
        urlImage: userInfo.urlImage,
        name: "Eu",
        steps: userInfo.steps.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _setUserCard();
    return Column(
      children: [_user],
    );
  }
}
