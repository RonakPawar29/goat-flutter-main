import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Membertyp extends StatefulWidget {
  const Membertyp({super.key});

  @override
  State<Membertyp> createState() => _MembertypState();
}

class _MembertypState extends State<Membertyp> {
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
          child: Column(
            children: [
                      Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: Height*1,
                          child: Column(
                            children: [
                        Container(
                            color: Colors.black,
                            height: double.infinity,
                            width: width * 1,
                            child: Column(
                              children: [
                                Text(
                                  "GYM\n MEMBERSHIP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: HexColor("FF6500"),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: Height * 0.027,
                                ),
                                Image.asset("assets/Group 22.png")
                              ],
                            ))
                      ]
                      )
                      ),
                      Positioned(
                          top: Height * 0.20,
                          height: Height*1,
                          width: width * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25)),
                              color: HexColor("FFFFFF"),
                            ),
                            child: Container(
                              height: Height * 1,
                              width: width * 1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: Height * 0.040),
                
                                  //PLATINUM//
                
                                  Container(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: width * 0.85,
                                        height: Height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: 
                                          
                                          
                                          LinearGradient(
                                            colors: <Color>[
                                            Color(0xFF111111), 
                                             Color(0xFF444444), // S// Dark center
                  Color(0xFF151515),
                  Color(0xFF181818),
                  Color(0xFF444444),
                   Color(0xFF1A1A1A),
                    Color(0xFF1A1A1A),
                  Color(0xFF1A1A1A),
                   // Slightly lighter radial zones
                   
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),




                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Height * 0.50,
                                                    width: width * 0.50,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/Vector.png"),
                                                        Text(
                                                          'PATINUM',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          color: HexColor("D3D3D3"),
                                                            letterSpacing: 1.9,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Text(
                                                          'Free Personal training',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              
                                                              color: HexColor("D3D3D3"),),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Discounts Add On',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: HexColor("D3D3D3"),),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Diet & Nutrition',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: HexColor("D3D3D3"),),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment:
                                                                Alignment.topCenter,
                                                            child: Image.asset(
                                                              'assets/Rectangle 11.png',
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              height: 35,
                                                              width: 80,
                                                            ),
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            '9,000',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                               color: HexColor("D3D3D3"),
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 22.0),
                                                          )),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12 Months',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Height * 0.040),
                                  Container(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: width * 0.85,
                                        height: Height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              HexColor("19c4b9"),
                                              HexColor("10a196"),
                                              HexColor("0c8d82"),
                                              HexColor("0c564c"),
                                              HexColor("0b786f"),
                                              HexColor("19c4b9"),
                                              HexColor("12ac9c"),
                                              HexColor("04473f"),
                                              HexColor("0a635c"),
                                              HexColor("045d50"),
                                              HexColor("0b6d61"),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Height * 0.50,
                                                    width: width * 0.50,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/Vector.png"),
                                                        Text(
                                                          'PATINUM',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            letterSpacing: 1.9,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Text(
                                                          'Free Personal training',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Discounts Add On',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Diet & Nutrition',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment:
                                                                Alignment.topCenter,
                                                            child: Image.asset(
                                                              'assets/Rectangle 10.png',
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              height: 35,
                                                              width: 80,
                                                            ),
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            '9,000',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 22.0),
                                                          )),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12 Months',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                
                                  Container(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: width * 0.85,
                                        height: Height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              HexColor("9d6054"),
                                              HexColor("dc9e90"),
                                              HexColor("f9eae3"),
                                              HexColor("dc9e90"),
                                              HexColor("e8c2b6"),
                                              HexColor("f3d4c4"),
                                              HexColor("edcccc"),
                                              HexColor("dfb3ac"),
                                              HexColor("ac7d74"),
                                              HexColor("ac7c6c"),
                                              HexColor("b78c81"),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Height * 0.50,
                                                    width: width * 0.50,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/Vector.png"),
                                                        Text(
                                                          'PATINUM',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            letterSpacing: 1.9,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Text(
                                                          'Free Personal training',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Discounts Add On',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Diet & Nutrition',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment:
                                                                Alignment.topCenter,
                                                            child: Image.asset(
                                                              'assets/Rectangle 10.png',
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              height: 35,
                                                              width: 80,
                                                            ),
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            '9,000',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 22.0),
                                                          )),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12 Months',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                
                                  //SILVER//
                                  SizedBox(height: Height * 0.040),
                                  Container(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: width * 0.85,
                                        height: Height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              HexColor("E3E3E3"),
                                              HexColor("D5D5D5"),
                                              HexColor("CACACA"),
                                              HexColor("C7C7C7"),
                                              HexColor("8E8E8E"),
                                              HexColor("ACACAC"),
                                              HexColor("CDCDCD"),
                                              HexColor("D9D9D9"),
                                              HexColor("E0E0E0"),
                                              HexColor("F3F3F3"),
                                              HexColor("FFFFFF"),
                                              HexColor("E5E5E5"),
                                              HexColor("BFBFBF"),
                                              HexColor("A8A8A8"),
                                              HexColor("959595"),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Height * 0.50,
                                                    width: width * 0.50,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/Group 6.png"),
                                                        Text(
                                                          'SILVER',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            letterSpacing: 1.9,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Text(
                                                          'Free Personal training',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Discounts Add On',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Diet & Nutrition',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment:
                                                                Alignment.topCenter,
                                                            child: Image.asset(
                                                              'assets/Rectangle 11.png',
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              height: 35,
                                                              width: 80,
                                                            ),
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            '12,000',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 22.0),
                                                          )),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12 Months',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Height * 0.040),
                
                                  //GOLD//
                
                                  Container(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: width * 0.85,
                                        height: Height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              HexColor("FFFB90"),
                                              HexColor("EEE37E"),
                                              HexColor("C2A64E"),
                                              HexColor("996C22"),
                                              HexColor("F0E87B"),
                                              HexColor("FFFFAA"),
                                              HexColor("FBE878"),
                                              HexColor("D1AB59"),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Height * 0.50,
                                                    width: width * 0.50,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/Group 9.png"),
                                                        Text(
                                                          'GOLD',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            letterSpacing: 1.9,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Text(
                                                          'Free Personal training',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Discounts Add On',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Diet & Nutrition',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment:
                                                                Alignment.topCenter,
                                                            child: Image.asset(
                                                              'assets/Rectangle 11.png',
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              height: 35,
                                                              width: 80,
                                                            ),
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            '15,000',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 22.0),
                                                          )),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12 Months',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
            ],
          ),
        ),
      ),
    ));
  }
}
