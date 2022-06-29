import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double weightController =  60;
  double heightController = 150;
  int age = 20;
  String? sex;
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                  color: sex == 'Female' ? Color.fromARGB(127, 250, 89, 78) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: Image.asset(
                  'images/female.png',
                  height: 90,
                ),
              )
            ),
          ]),
    
    
    
    
    
    
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              ),
            child: Column(
              children: [
                Text("$heightController cm",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                  )
                ),
                Slider(
                  value: heightController,
                  max: 300,
                  divisions: 300,
                  activeColor: sex == 'Female' ? Colors.red : Colors.blue,
                  onChanged: (double value){
                    setState((){
                      heightController = value.roundToDouble();
                    });
                  }
                ),
              ],
            ),
          ),
          
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
          Container(
            width: 170,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: BoxDecoration(
              color: sex == 'Male'? Color.fromARGB(255, 42, 67, 88) : sex == 'Female' ? Color.fromARGB(127, 250, 89, 78) : Colors.transparent,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(width: 20),
                Text("Weight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                SizedBox(height: 10),
                
                Text("$weightController",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  )
                ),

                SizedBox(height: 5),

              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  GestureDetector(
                  child: Image.asset('images/plus.png', width: 40),
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

                GestureDetector(
                  child: Image.asset('images/minus.png', width: 40),
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
              ]),

              ],
            ),
          ),


          Container(
            width: 170,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: BoxDecoration(
              color: sex == 'Male'? Color.fromARGB(255, 42, 67, 88) : sex == 'Female' ? Color.fromARGB(127, 250, 89, 78) : Colors.transparent,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              SizedBox(width: 20),
                Text("Age",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                SizedBox(height: 10),

                Text("$age", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  )
                ),

                SizedBox(height: 5),

              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  GestureDetector(
                  child: Image.asset('images/plus.png', width: 40),
                  onTap: (){
                    setState((){
                      age++;
                    });
                  },
                  onLongPress: (){
                    setState((){
                      age = age + 5;
                    });
                  },
                ),

                GestureDetector(
                  child: Image.asset('images/minus.png', width: 40),
                  onTap: (){
                    setState((){
                      age--;
                    });
                  },
                  onLongPress: (){
                    setState((){
                      age = age - 5;
                    });
                  },
                ),
              ]),

              ],
            ),
          ),
          ]
        ),



    
    
    
          ElevatedButton(
            child: Text("Calculate", 
              style: TextStyle(
                color: sex != null ? Colors.white : Colors.orange, 
                fontSize: 35, 
              )
            ),
            onPressed: (){
              if (sex != null){
                setState(() { 
                  double weight = weightController;
                  double height = heightController/100;
                  double result = weight / (height * height);
                  bmi = double.parse(result.toStringAsFixed(2));
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return Result(result: bmi);
                  })
                );
              }
            },
            style: ElevatedButton.styleFrom(
              primary: sex == 'Male' ? Color.fromARGB(255, 42, 67, 88) : sex == 'Female' ? Color.fromARGB(127, 250, 89, 78) : Color.fromARGB(255, 13, 4, 43),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              ),
          ),
          
          // SizedBox(height: 50),
          // Text("$bmi", style: TextStyle(
          //   fontSize: 65, 
          //   color: bmi == 0 ? Colors.white : bmi < 18.5 ? Colors.red : bmi < 24.9 && bmi > 18.5 ? Colors.green[700] : bmi > 24.9 && bmi < 29.9 ? Colors.red[400] : Colors.red[700],
          //   fontWeight: FontWeight.bold)
          // )
    
        ],
    );
  }
}