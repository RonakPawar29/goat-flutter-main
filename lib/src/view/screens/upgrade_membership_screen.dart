import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'form_loader_screen_deprecated.dart';

class GymMembershipScreen extends StatelessWidget {
  const GymMembershipScreen({super.key});
  
  GymInformetion get context => GymInformetion();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        body: SingleChildScrollView( // Ensuring full scrollability
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: height,
                    width: width,
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Text(
                          'GYM MEMBERSHIP',
                          style: TextStyle(
                            color: HexColor("FF6500"),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Select As Per Your Need',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  // Membership Cards Section

                  
                  Positioned(
                    top: height*0.20,
                    
                  child: 
                    
                    SingleChildScrollView(
                      child: Container(
                      width: width,
                      height: height*1,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                       color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildMembershipCard(
                            'PLATINUM',
                            LinearGradient(
                              colors: [
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
                            '12 Months',
                          ),
                          _buildMembershipCard(
                            'SILVER',
                            LinearGradient(
                              colors: [
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
                            '8 Months',
                          ),
                          _buildMembershipCard(
                            'GOLD',
                            LinearGradient(
                              colors: [
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
                            '12 Months',
                          ),
                                      
                          const SizedBox(height: 5), // Adding spacing before the button
                          _buildConfirmButton(context),
                        ],
                      ),
                                        ),
                    ),
                  
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipCard(String title, LinearGradient linearGradient, String duration) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: linearGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Free Personal Training\nDiscounts Add On\nDiet & Nutrition',
            style: TextStyle(
              color: Color.fromARGB(179, 0, 0, 0),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '₹9,999',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget _buildConfirmButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor("FF6500"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        // Navigate to ProfileScreen when button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Gyminfo(),
          ),
        );
        print("Confirm button pressed!");
      },
      child: const Text(
        'CONFIRM',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
}
