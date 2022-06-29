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
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 13, 4, 43)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BIM Calculator", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,fontFamily: "Helvetica", color: Color.fromARGB(255, 13, 4, 43))),
          backgroundColor: Color.fromARGB(216, 255, 153, 0),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: MainPage(),
          )
        )
      )
    );
  }
}