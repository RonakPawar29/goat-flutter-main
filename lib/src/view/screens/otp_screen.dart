import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_page/src/view/screens/Custom_Button.dart';
import 'package:login_page/src/view/screens/goat_loading1_screen.dart';
class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  
  bool get isLoading => true;
  
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SafeArea(
    child:   Scaffold(
        body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Container(
                height: screenHeight*0.6,
                color: Colors.amber,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      // Kettlebell image
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Exercise mat image (you'd position this correctly)
                          Positioned(
                          
                            child: Image.asset(
                              'assets/gym-accessories-empty-room 1.png',height: screenHeight*0.6,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bottom white card with login form
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.5, // Bottom 50% of screen
                  decoration: BoxDecoration(
                    boxShadow: [
                       BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // LOGIN text
                        Text(
                          'OTP',
                          style: TextStyle(
                            color: Color(0xFFFF6700), // Orange color
                            fontSize: screenHeight * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        
                        // Mobile number input
                        Container(
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0), // Light grey
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter 4-Digit OTP',
                                hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: screenHeight * 0.018,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        
                        // 
                        //
                CustomButton(
          text: "CONFIRM",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  GymLoaderScreen1no3 ()),
                         
            );
          }
            ),
                                SizedBox(height: screenHeight * 0.03),
                       
         Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                // Google logo container
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/download.png',
                   height: screenWidth*0.70,

                  ),
                ),
                
                // Separator
                const SizedBox(width: 16),
                
                // Text container
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          )
                        : const Text(
                            'Sign up with Google',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
                
                // Arrow container
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
                     )                  
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
     
      )
      ),
    );
  }
}