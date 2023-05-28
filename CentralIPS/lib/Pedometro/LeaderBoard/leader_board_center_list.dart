import 'package:centralips/Pedometro/LeaderBoard/leader_board_center.dart';
import 'package:centralips/Pedometro/LeaderBoard/load/user_data_leaderboard.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterList extends StatelessWidget {
  LeaderBordCenterList({super.key, required this.listOfUsersSteps});
  List<UserDataLeaderboard> listOfUsersSteps;

  //construct the list of users
  List<LeaderBoardCenter> _listOfUsers() {
    //sort the listOfUsersSteps by steps

    List<LeaderBoardCenter> list = [];
    for (int i = 3; i < listOfUsersSteps.length; i++) {
      list.add(LeaderBoardCenter(
        placeNumber: "${i + 1}º",
        urlImage: listOfUsersSteps[i].urlImage,
        name: listOfUsersSteps[i].name,
        steps: listOfUsersSteps[i].steps.toString(),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _listOfUsers(),
    );
  }
}
