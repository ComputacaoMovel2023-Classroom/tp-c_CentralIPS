import 'package:centralips/Pedometro/LeaderBord/leader_bord_center.dart';
import 'package:flutter/material.dart';

class LeaderBordCenterUser extends StatelessWidget {
  const LeaderBordCenterUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LeaderBordCenter(
          placeNumber: "111º",
          urlImage:
              "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw",
          name: "Eu",
          steps: "1100",
        ),
      ],
    );
  }
}
