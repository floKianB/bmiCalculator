import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  Result({Key? key, required double this.result}) : super(key: key);
  double result;
  @override
  Widget build(BuildContext context) {
    return(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 13, 4, 43)),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Text("$result",
                style: TextStyle(
                  fontSize: 40,
                  color: result < 18.5 ? Colors.yellow : result > 18.5 && result < 25 ? Colors.green : result < 30 && result > 25 ? Colors.yellow : Colors.red ,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}