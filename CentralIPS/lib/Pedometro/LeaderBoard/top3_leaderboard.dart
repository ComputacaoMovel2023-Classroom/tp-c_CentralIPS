import 'package:flutter/material.dart';

class Top3LeaderBoard extends StatelessWidget {
  const Top3LeaderBoard(
      {super.key,
      required this.nameFirst,
      required this.nameSecond,
      required this.nameThird,
      required this.stepsFirst,
      required this.stepsSecond,
      required this.stepsThird,
      required this.urlFirst,
      required this.urlSecond,
      required this.urlThird});

  final String nameFirst;
  final String nameSecond;
  final String nameThird;

  final String urlFirst;
  final String urlSecond;
  final String urlThird;

  final String stepsFirst;
  final String stepsSecond;
  final String stepsThird;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 6,
                      color: Colors.grey,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      urlSecond,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      width: 80,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LimitedBox(
              maxWidth: 80,
              maxHeight: 40,
              child: Text(
                nameSecond,
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(
              '$stepsSecond passos',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 16), // Espaço entre os círculos
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 8,
                      color: Colors.yellow,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      urlFirst,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      width: 120,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LimitedBox(
                maxWidth: 120,
                maxHeight: 40,
                child: Text(
                  nameFirst,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                )),
            Text(
              '$stepsFirst passos',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 16), // Espaço entre os círculos
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 6,
                      color: Colors.orange,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      urlThird,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      width: 80,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LimitedBox(
                maxWidth: 80,
                child: Text(
                  nameThird,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                )),
            Text(
              '$stepsThird passos',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
