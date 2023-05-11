import 'package:centralips/Pedometro/LeaderBord/leader_bord_center.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterFisrtThree extends StatelessWidget {
  const LeaderBordCenterFisrtThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LeaderBordCenter.buildLeaderBordCenterChooseColor(
            Colors.yellow[300]!,
            "1º",
            "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw",
            "1100",
            "Eu"),
        LeaderBordCenter.buildLeaderBordCenterChooseColor(
          Colors.grey[300]!,
          "2º",
          "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw",
          "1000",
          "Joao",
        ),
        LeaderBordCenter.buildLeaderBordCenterChooseColor(Colors.orange, "3º",
            "https://i.imgur.com/BoN9kdC.png", "100", "Ricardo")
      ],
    );
  }
}
