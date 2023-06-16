import 'package:centralips/Pedometro/LeaderBoard/leader_board_center.dart';
import 'package:centralips/Pedometro/LeaderBoard/load/user_data_leaderboard.dart';
import 'package:flutter/material.dart';

class LeaderBoardCenterFirstThree extends StatelessWidget {
  LeaderBoardCenterFirstThree({super.key, required this.listOfUsersSteps});

  List<UserDataLeaderboard> listOfUsersSteps;

  // 3 object of UserDataLeaderbord
  UserDataLeaderboard? firstplace;
  UserDataLeaderboard? secondplace;
  UserDataLeaderboard? thirdplace;

  void _setPlaces() {
    //sort the listOfUsersSteps by steps

    if (listOfUsersSteps.length >= 3) {
      firstplace = listOfUsersSteps[0];
      secondplace = listOfUsersSteps[1];
      thirdplace = listOfUsersSteps[2];
    } else if (listOfUsersSteps.length == 2) {
      firstplace = listOfUsersSteps[0];
      secondplace = listOfUsersSteps[1];
      thirdplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    } else if (listOfUsersSteps.length == 1) {
      firstplace = listOfUsersSteps[0];
      secondplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      thirdplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    } else {
      firstplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      secondplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      thirdplace = UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    _setPlaces();

    //print("joaquima");
    return Column(
      children: [
        LeaderBoardCenter.buildLeaderBordCenterChooseColor(
            Colors.yellow[300]!,
            "1º",
            firstplace!.urlImage,
            firstplace!.steps.toString(),
            firstplace!.name),
        LeaderBoardCenter.buildLeaderBordCenterChooseColor(
          Colors.grey[300]!,
          "2º",
          secondplace!.urlImage,
          secondplace!.steps.toString(),
          secondplace!.name,
        ),
        LeaderBoardCenter.buildLeaderBordCenterChooseColor(
            Colors.orange,
            "3º",
            thirdplace!.urlImage,
            thirdplace!.steps.toString(),
            thirdplace!.name)
      ],
    );
  }
}
