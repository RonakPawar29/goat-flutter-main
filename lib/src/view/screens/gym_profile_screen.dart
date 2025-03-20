import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';

class GymInfoScreen extends StatelessWidget {
  const GymInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              
           child:    Container(
    height: 190.0,
    decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
                "assets/craig-lovelidge-zutFWguXEL8-unsplash 1.png"),
            fit: BoxFit.fill)),
    child: const Center(
      child: Text('GOLD GYM',style: TextStyle(
        color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
      ),),
    ),
  ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Center(
              child: Text(
                '23/18, Behind SICA School Road, Vijay Nagar, Indore',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                '(91+8273827382)',
                style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
                ],
              ),
            ),
            
            Container(
              
              child: Column(
                children: [
 const SizedBox(height: 20),
 Container(
  child: Column(
    children: [
      Container(
        child:  _buildInfoCard('Morning', '05:00 AM to 11:00 AM'),

      ),
      Container(
       
        child:            _buildInfoCard('Evening', '05:00 PM to 11:00 PM'),
 
      )
    ],
  ),
 ),

          Container(
           
            child: Column(
              children: [
const SizedBox(height: 20),
            _buildDetails('Email', 'Goldgymsch54@gmail.com'),
            _buildDetails('Gym Type', 'Fitness Studio, Yoga Center & Zumba'),
            _buildDetails('Gym Area', '3 Floors (2500+ Sqft)'),
            _buildDetails('Payment Type', 'Credit Card, UPI, Pay Later'),
            _buildDetails('Service Offered', 'Platinum, Gold & Silver'),
            _buildDetails('Amenities', 'Locker, WiFi, Shower & Parking'),
              ],
            ),
          ), 


             Container(
                decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
                                width: screenWidth * 0.85,
                                child: TextButton(
                                  onPressed: () {


                                     Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>GymDashboardScreen(),
        ),
      );
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: HexColor("FF6500"),
                                  ),
                                  child: FittedBox(
                                    child: AutoSizeText(
                                      "CONFIRM",
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.026,
                                        color: HexColor("FFFFFF"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                ],
              ),
            )
           
          ],
        ),
      ),
      ),
    );
      
      
  
  }

  Widget _buildInfoCard(String title, String time,) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        subtitle: Text(time, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildDetails(String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            detail,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
