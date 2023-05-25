import 'package:centralips/Pedometro/LeaderBord/leader_bord_center.dart';
import 'package:centralips/Pedometro/LeaderBord/load/user_data_leaderbord.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterList extends StatelessWidget {
  LeaderBordCenterList({super.key, required this.listOfUsersSteps});
  List<UserDataLeaderbord> listOfUsersSteps;

  //construct the list of users
  List<LeaderBordCenter> _listOfUsers() {
    //sort the listOfUsersSteps by steps

    List<LeaderBordCenter> list = [];
    for (int i = 3; i < listOfUsersSteps.length; i++) {
      list.add(LeaderBordCenter(
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
