import 'package:centralips/Pedometro/LeaderBoard/leader_board_center_first_three.dart';
import 'package:centralips/Pedometro/LeaderBoard/leader_board_center_list.dart';
import 'package:centralips/Pedometro/LeaderBoard/leader_board_center_user.dart';
import 'package:centralips/Pedometro/LeaderBoard/load/user_data_leaderboard.dart';
import 'package:centralips/Pedometro/LeaderBoard/load/load_data_leaderboard.dart';
import 'package:centralips/Pedometro/LeaderBoard/top3_leaderboard_list.dart';
import 'package:flutter/material.dart';

import '../../Sidebar/NavBar.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  _LeaderBordState createState() => _LeaderBordState();
}

class _LeaderBordState extends State<LeaderBoard> {
  //define the map

  Map<String, UserDataLeaderboard> listOfUsersByID = {};
  List<UserDataLeaderboard> listOfUsersSteps = [];

  void initialList() {
    //insert the list with default data
    for (int i = 0; i < 10; i++) {
      listOfUsersSteps.add(UserDataLeaderboard.all(
          name: "User",
          steps: 0,
          urlImage:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"));
    }
  }

  @override
  void initState() {
    super.initState();
    initialList();
    Map<String, UserDataLeaderboard> tempById = {};

    LoadDataLeaderboard.loadData(tempById, () {
      setState(() {
        listOfUsersByID = tempById;

        //get the list of the users steps sorted
        listOfUsersSteps = listOfUsersByID.values.toList();
        listOfUsersSteps.sort((a, b) => b.steps.compareTo(a.steps));
      });
    });
  }

  //mehtod to construct the list of the users

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/header.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Scaffold(
          //bottomNavigationBar: const BottomNavigationExample(),
          resizeToAvoidBottomInset: false,
          drawer: const NavBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
              child: SizedBox(
                height: 500,
                child: ListView(children: [
                  Column(children: [
                    SizedBox(
                      width: 400,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextButton.icon(
                                  label: const SizedBox.shrink(),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    //get back to the previous screen
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                  // color: Colors.black
                                ),
                              ),
                              const SizedBox(width: 40),
                              const Center(
                                child: Text('LeaderBord',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Top3LeaderBoardList(
                            listOfUsersSteps: listOfUsersSteps,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 16),
                          child: Divider(
                            color: Colors.black,
                            height: 0,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                        ),
                        LeaderBordCenterUser(
                          listOfUsersByID: listOfUsersByID,
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              LeaderBoardCenterFirstThree(
                                  listOfUsersSteps: listOfUsersSteps),
                              LeaderBordCenterList(
                                listOfUsersSteps: listOfUsersSteps,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ]),
                ]),
              )))
    ]);
  }
}
