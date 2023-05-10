import 'package:centralips/Pedometro/LeaderBord/top3_leaderbord.dart';
import 'package:flutter/cupertino.dart';

class Top3LeaderBordList extends StatelessWidget {
  const Top3LeaderBordList({super.key});

  @override
  Widget build(BuildContext context) {
    //returns the top 3 users
    return const Top3LeaderBord(
        nameFirst: "Joao",
        nameSecond: "Ricardo",
        nameThird: "Pedro",
        stepsFirst: "10000",
        stepsSecond: "1000",
        stepsThird: "100",
        urlFirst:
            "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw",
        urlSecond:
            "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw",
        urlThird:
            "https://media.licdn.com/dms/image/C4E03AQEMpP3u9yXiLw/profile-displayphoto-shrink_800_800/0/1618735950494?e=2147483647&v=beta&t=OKKrkGxfU6BtEgN7hcjCL3uSdYQtpEFMBhqcY3yTRhw");
  }
}
