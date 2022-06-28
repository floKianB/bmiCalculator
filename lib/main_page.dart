import 'package:flutter/material.dart';
import './widgets/oval.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final weightController =  TextEditingController();
  final heightController =  TextEditingController();
  double bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 120,
              child: TextField(
                controller: weightController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[800],
                  ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 3.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    hintText: 'Weight',
                    hintStyle: TextStyle(color: Colors.blue[400])
                ),                
              ),
            ),

            Container(
              width: 120,
              child: TextField(
                controller: heightController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[800],
                  ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 3.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    hintText: 'Height',
                    hintStyle: TextStyle(color: Colors.blue[400])
                ),
              ),
            ),

        ]),
        SizedBox(height: 80),
        ElevatedButton(
          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 25, )),
          onPressed: (){
            setState(() { 
              double weight = double.parse(weightController.text);
              double height = double.parse(heightController.text)/100;
              double result = weight / (height * height);
              bmi = double.parse(result.toStringAsFixed(2));
              });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            ),
        ),
        
        SizedBox(height: 50),
        Text("$bmi", style: TextStyle(
          fontSize: 65, 
          color: bmi == 0 ? Colors.black : bmi < 18.5 ? Colors.red : bmi < 24.9 && bmi > 18.5 ? Colors.green[700] : bmi > 24.9 && bmi < 29.9 ? Colors.red[400] : Colors.red[700],
          fontWeight: FontWeight.bold)
        )

      ],
    );
  }
}