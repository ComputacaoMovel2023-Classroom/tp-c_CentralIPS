import 'package:flutter/material.dart';

class LeaderBordCenter extends StatelessWidget {
  const LeaderBordCenter(
      {super.key,
      required this.placeNumber,
      required this.urlImage,
      required this.steps,
      required this.name});

  final String placeNumber;
  final String urlImage;
  final String steps;
  final String name;

  //create a method to return a widget
  static Padding buildLeaderBordCenterChooseColor(Color color,
      String placeNumber, String urlImage, String steps, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 370,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        placeNumber,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          urlImage), // Substitua pelo caminho correto da imagem
                    ),
                    const SizedBox(width: 16),
                    LimitedBox(
                      maxWidth: 100,
                      child: Text(
                        name,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Text(
                  steps, // Novo número
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 370,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        placeNumber,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          urlImage), // Substitua pelo caminho correto da imagem
                    ),
                    const SizedBox(width: 16),
                    LimitedBox(
                        maxWidth: 100,
                        child: Text(
                          name,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Text(
                  steps, // Novo número
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
