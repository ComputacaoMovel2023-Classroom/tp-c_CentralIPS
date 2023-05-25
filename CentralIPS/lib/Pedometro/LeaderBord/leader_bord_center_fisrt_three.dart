import 'package:centralips/Pedometro/LeaderBord/leader_bord_center.dart';
import 'package:centralips/Pedometro/LeaderBord/load/user_data_leaderbord.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterFisrtThree extends StatelessWidget {
  LeaderBordCenterFisrtThree({super.key, required this.listOfUsersSteps});

  List<UserDataLeaderbord> listOfUsersSteps;

  // 3 object of UserDataLeaderbord
  UserDataLeaderbord? firstplace;
  UserDataLeaderbord? secondplace;
  UserDataLeaderbord? thirdplace;

  void _setPlaces() {
    //sort the listOfUsersSteps by steps

    if (listOfUsersSteps.length >= 3) {
      firstplace = listOfUsersSteps[0];
      secondplace = listOfUsersSteps[1];
      thirdplace = listOfUsersSteps[2];
    } else if (listOfUsersSteps.length == 2) {
      firstplace = listOfUsersSteps[0];
      secondplace = listOfUsersSteps[1];
      thirdplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    } else if (listOfUsersSteps.length == 1) {
      firstplace = listOfUsersSteps[0];
      secondplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      thirdplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    } else {
      firstplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      secondplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      thirdplace = UserDataLeaderbord.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    _setPlaces();

    print("joaquima");
    return Column(
      children: [
        LeaderBordCenter.buildLeaderBordCenterChooseColor(
            Colors.yellow[300]!,
            "1º",
            firstplace!.urlImage,
            firstplace!.steps.toString(),
            firstplace!.name),
        LeaderBordCenter.buildLeaderBordCenterChooseColor(
          Colors.grey[300]!,
          "2º",
          secondplace!.urlImage,
          secondplace!.steps.toString(),
          secondplace!.name,
        ),
        LeaderBordCenter.buildLeaderBordCenterChooseColor(
            Colors.orange,
            "3º",
            thirdplace!.urlImage,
            thirdplace!.steps.toString(),
            thirdplace!.name)
      ],
    );
  }
}
