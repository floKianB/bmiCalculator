import 'package:flutter/material.dart';
import './widgets/oval.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double weightController =  60;
  double heightController = 150;
  String? sex;
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
            onTap: (){
              setState((){
                sex = 'Male';
              });
            },
            child:  Container(
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: sex == 'Male' ? Color.fromARGB(255, 42, 67, 88) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: Image.asset(
                'images/male.png',
                height: 90,
              ),
            )
          ),

          GestureDetector(
            onTap: (){
              setState((){
                sex = 'Female';
              });
            },
            child:  Container(
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: sex == 'Female' ? Color.fromARGB(255, 42, 67, 88) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: Image.asset(
                'images/female.png',
                height: 90,
              ),
            )
          ),
        ]),



        SizedBox(height: 60),



        Container(
          child: Column(
            children: [
              Text("$heightController cm",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200],
                )
              ),
              Slider(
                value: heightController,
                max: 300,
                divisions: 300,
                onChanged: (double value){
                  setState((){
                    heightController = value.roundToDouble();
                    print(value);
                  });
                }
              ),
            ],
          ),
        ),
        
        SizedBox(height: 60),


      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('images/plus.png', width: 35),
            onTap: (){
              setState((){
                weightController++;
              });
            },
            onLongPress: (){
              setState((){
                weightController = weightController + 5;
              });
            },
          ),

        SizedBox(width: 20),

          Text("$weightController kg", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            )
          ),

        SizedBox(width: 20),

          GestureDetector(
            child: Image.asset('images/minus.png', width: 35),
            onTap: (){
              setState((){
                weightController--;
              });
            },
            onLongPress: (){
              setState((){
                weightController = weightController - 5;
              });
            },
          ),

        ],
      ),






        SizedBox(height: 80),
        ElevatedButton(
          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 25, )),
          onPressed: (){
            setState(() { 
              double weight = weightController;
              double height = heightController/100;
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
          color: bmi == 0 ? Colors.white : bmi < 18.5 ? Colors.red : bmi < 24.9 && bmi > 18.5 ? Colors.green[700] : bmi > 24.9 && bmi < 29.9 ? Colors.red[400] : Colors.red[700],
          fontWeight: FontWeight.bold)
        )

      ],
    );
  }
}