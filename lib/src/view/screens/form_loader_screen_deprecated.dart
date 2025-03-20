import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'gym_profile_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Gyminfo extends StatefulWidget {
  const Gyminfo({super.key});

  @override
  State<Gyminfo> createState() => _LoginState();
}

class _LoginState extends State<Gyminfo> {
  String selectedOption = "Morning"; // Default selected option

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
         extendBodyBehindAppBar: true,
        appBar: AppBar(
          
          clipBehavior: Clip.hardEdge,
          
        leading:  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Container(
            height: Height * 1,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: Height * 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/close-up-athlete-training 1.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                top: Height * 0.070,
                                height: Height / 2,
                                width: width * 1,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: LinearPercentIndicator(
                                      width: width * 0.90,
                                      animation: true,
                                      lineHeight: Height * 0.02,
                                      animationDuration:3000,
                                      percent: 1.0,
                                      barRadius: Radius.circular(20),
                                      progressColor: HexColor("FF6500"),
                                      backgroundColor: HexColor("EDDADA"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: Height * 0.35,
                      height: Height * 1,
                      width: width * 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                          color: HexColor("FFFFFF"),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Height * 0.025,
                            ),
                            Text(
                              "Gym Information",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: HexColor("FF6500"),
                              ),
                            ),
                            SizedBox(
                              height: Height * 0.025,
                            ),
                            Container(

                              child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
  width: width * 0.85,
  child: TextField(
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500), // Using direct Color constructor
        ),
      ),
      enabledBorder: OutlineInputBorder( // Add this to show border in normal state
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500),
        ),
      ),
      hintText: 'Enter Gym Name ',
    ),
  ),
)  ,
                          SizedBox(
                              height: Height * 0.025,
                            ),       
                           Container(
  width: width * 0.85,
  child: TextField(
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500), // Using direct Color constructor
        ),
      ),
      enabledBorder: OutlineInputBorder( // Add this to show border in normal state
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500),
        ),
      ),
      hintText: 'Email Address',
    ),
  ),
)  ,
 SizedBox(
                              height: Height * 0.025,
                            ),   

                                Container(
  width: width * 0.85,
  child: TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500), // Using direct Color constructor
        ),
      ),
      enabledBorder: OutlineInputBorder( // Add this to show border in normal state
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500),
        ),
      ),
      hintText: 'Phone No.',
    ),
  ),
)  ,
                          SizedBox(
                              height: Height * 0.025,
                            ),    

                         Container(
  width: width * 0.85,
  child: TextField(
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500), // Using direct Color constructor
        ),
      ),
      enabledBorder: OutlineInputBorder( // Add this to show border in normal state
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFF6500),
        ),
      ),
      hintText: 'Upload Gym Logo',
    ),
  ),
)  ,


                          SizedBox(
                              height: Height * 0.025,
                            ),    

Container(
  width: width * 0.85,
  child: TextButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GymInfoScreen (),
        ),
      );
    },
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFFFF6500), // Changed from HexColor to Color
    ),
    child: FittedBox(
      child: AutoSizeText(
        "CONFIRM",
        style: TextStyle(
          fontSize: Height * 0.026,
          color: Color(0xFFFFFFFF), // Changed from HexColor to Color
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
                                      
                                      
                                    ],
                                  ),
                                ],
                              ),
                            ),
                             
                       
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String label, double width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: Container(
        alignment:Alignment.center,
        width: width*0.425,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedOption == label
              ? HexColor("FF6500").withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            color: HexColor("FF6500"),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
        
          label,
          style: TextStyle(
            
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GymInformetion {
}
