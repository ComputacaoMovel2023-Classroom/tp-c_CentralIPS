import 'package:centralips/Pedometro/LeaderBoard/load/user_data_leaderboard.dart';
import 'package:centralips/Pedometro/LeaderBoard/top3_leaderboard.dart';
import 'package:flutter/cupertino.dart';

class Top3LeaderBoardList extends StatelessWidget {
  Top3LeaderBoardList({super.key, required this.listOfUsersSteps});

  List<UserDataLeaderboard> listOfUsersSteps;

  @override
  Widget build(BuildContext context) {
    //returns the top 3 users
    //set default values when the list is empty

    return Top3LeaderBoard(
        nameFirst:
            (listOfUsersSteps.isNotEmpty) ? listOfUsersSteps[0].name : "User",
        nameSecond:
            (listOfUsersSteps.length >= 2) ? listOfUsersSteps[1].name : "User",
        nameThird:
            (listOfUsersSteps.length >= 3) ? listOfUsersSteps[2].name : "User",
        stepsFirst: (listOfUsersSteps.isNotEmpty)
            ? listOfUsersSteps[0].steps.toString()
            : "0",
        stepsSecond: (listOfUsersSteps.length >= 2)
            ? listOfUsersSteps[1].steps.toString()
            : "0",
        stepsThird: (listOfUsersSteps.length >= 3)
            ? listOfUsersSteps[2].steps.toString()
            : "0",
        urlFirst: (listOfUsersSteps.isNotEmpty)
            ? listOfUsersSteps[0].urlImage
            : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
        urlSecond: (listOfUsersSteps.length >= 2)
            ? listOfUsersSteps[1].urlImage
            : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
        urlThird: (listOfUsersSteps.length >= 3)
            ? listOfUsersSteps[2].urlImage
            : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
  }
}
