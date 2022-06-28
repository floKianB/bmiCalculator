import 'package:flutter/material.dart';

class Oval extends StatelessWidget {
  const Oval({Key? key, this.width = 0, this.direction = 'Left', this.color = ''}) : super(key: key);
  final double width;
  final String direction;
  final String color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: direction == 'Left' ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [Container(
        width: width,
        height: 30,
        decoration: BoxDecoration(
          color: color == 'green' ? Colors.green : color == 'red' ? Colors.red : Colors.blue,
          borderRadius: BorderRadius.only(
            topRight: direction == 'Left' ? Radius.circular(20) : Radius.circular(0),
            topLeft: direction != 'Left' ? Radius.circular(20) : Radius.circular(0),
          )
        ),
      )
    ]);
  }
}