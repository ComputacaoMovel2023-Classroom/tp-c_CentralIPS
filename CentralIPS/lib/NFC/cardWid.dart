import 'package:flutter/material.dart';

class cardWid extends StatelessWidget {
  const cardWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 39, 29, 92),
                Color.fromARGB(255, 68, 112, 147),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Pedro Moura',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontFamily: "monospace")),
                    const Spacer(),
                    Stack(children: [
                      Image.asset(
                        'assets/images/logoips.png',
                        height: 60,
                      )
                    ]) //
                  ],
                ),
                Text('202100110',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white, fontFamily: "monospace"))
              ],
            ),
            const Text('€25',
                style: TextStyle(fontSize: 24, color: Colors.white))
          ],
        ));
  }
}
