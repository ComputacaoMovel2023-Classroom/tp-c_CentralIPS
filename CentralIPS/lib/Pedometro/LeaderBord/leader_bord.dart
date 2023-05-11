import 'package:centralips/Pedometro/LeaderBord/leader_bord_center_fisrt_three.dart';
import 'package:centralips/Pedometro/LeaderBord/leader_bord_center_list.dart';
import 'package:centralips/Pedometro/LeaderBord/leader_bord_center_user.dart';
import 'package:centralips/Pedometro/LeaderBord/top3_leaderbord_list.dart';
import 'package:flutter/material.dart';

import '../../Sidebar/NavBar.dart';

class LeaderBord extends StatelessWidget {
  const LeaderBord({super.key});

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
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Top3LeaderBordList(),
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
                        const LeaderBordCenterUser(),
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
                            children: const [
                              LeaderBordCenterFisrtThree(),
                              LeaderBordCenterList(),
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
