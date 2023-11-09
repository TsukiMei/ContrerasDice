import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
      MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.teal[200],
            appBar: AppBar(
              title: const Text('Dicee'),
              backgroundColor: Colors.pink[100],
            ),
            body: const DicePage(),
          )
      )
  );
}
class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}
class _DicePageState extends State<DicePage> {
  int left = 1, right = 1, sum = 0;
  @override
  Widget build(BuildContext context) {
    sum = left + right;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  )
              )),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    }, child: Image.asset('images/dice$right.png'),
                  )
              )),
            ],
          ),
          Text("The total roll is $sum",
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: "Merri",
                  color: Colors.pink
              )),
          Text(getWinner(),
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: "Merri",
                color: Colors.pink
              )),
        ],
      ),
    );
  }
  void changeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }
  String getWinner() {
    if (left > right) {
      return "Left dice rolls higher";
    } else if (right > left) {
      return "Right dice rolls higher";
    } else {
      return "Dice rolls are equal";
    }
  }
}