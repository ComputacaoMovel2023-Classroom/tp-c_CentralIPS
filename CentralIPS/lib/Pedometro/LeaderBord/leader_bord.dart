import 'package:centralips/Pedometro/LeaderBord/top3_leaderbord.dart';
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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
              child: Column(children: [
                SizedBox(
                  width: 400,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                          ),
                          SizedBox(width: 69),
                          Center(
                            child: Text('LeaderBord',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Top3LeaderBord(),
                    )
                  ]),
                )
              ])))
    ]);
  }
}
