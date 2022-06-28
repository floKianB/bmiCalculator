import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BIM Calculator", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,fontFamily: "Helvetica")),
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
          child: MainPage()
        )
      )
    );
  }
}