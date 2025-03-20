import 'package:flutter/material.dart';
// import 'package:http/http.dart' as Get;
import 'package:login_page/src/view/screens/Custom_Button.dart';
import 'package:login_page/src/view/screens/form_loader_screen.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';
import 'package:login_page/src/view/screens/otp_screen.dart';
import 'package:login_page/src/view/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';


import '../../services/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find<AuthController>();

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 168, 106),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 215, 101, 92),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                // Top half with image
                Container(
                  height: screenHeight * 0.5,
                  width: screenWidth,
                  color: Colors.black,
                  child: Center(
                    child: Image.asset(
                      'assets/gym-accessories-empty-room 1.png',
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenHeight * 0.5,
                    ),
                  ),
                ),

                // Bottom white card with login form
                Positioned(
                  top: screenHeight * 0.45,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 0.65, // Increased height to accommodate keyboard
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, -2),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
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
                              'LOGIN',
                              style: TextStyle(
                                color: Color(0xFFFF6700), // Orange color
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.05),

                            // Email input with controller
                            Container(
                              height: screenHeight * 0.056,
                              decoration: BoxDecoration(
                                color: Color(0xFFE0E0E0), // Light grey
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Email Address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: screenHeight * 0.018,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),

                            // Password input with controller
                            Container(
                              height: screenHeight * 0.056,
                              decoration: BoxDecoration(
                                color: Color(0xFFE0E0E0), // Light grey
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true, // Hide password
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: screenHeight * 0.018,
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Login button with API call
                            CustomButton(
                              text: "CONFIRM",
                              onPressed: () async {
                                print("Confirm button got invoked");

                                // Validate input fields before making API call
                                if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
                                  Get.snackbar("Error", "Email & Password cannot be empty",
                                      snackPosition: SnackPosition.BOTTOM);
                                  return;
                                }

                                // Call the login API and wait for response
                                bool isLoggedIn = await authController.login(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );

                                // If login is successful, navigate to GymDashboardScreen
                                if (isLoggedIn) {
                                  print("Sign In Successfully");
                                  Get.offAll(() => GymDashboardScreen()); // ✅ Replaces login screen
                                } else {
                                  print("Sign In Unsuccessfull");
                                  Get.snackbar("Error", "Invalid Credentials",
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                            ),

                            SizedBox(height: screenHeight * 0.02),

                          Container(
                            height: screenWidth * 0.10, // Responsive height (10% of screen width)
                            width: screenWidth * 0.6, // Responsive width (60% of screen width)
                            margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.orange, width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: () {
                                  print("Google Sign-In Clicked");
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.015,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Google logo container
                                      Container(
                                        width: screenWidth * 0.06,
                                        height: screenWidth * 0.06,
                                        child: Image.asset(
                                          'assets/download.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02), // Responsive spacing

                                      // Text container
                                      Text(
                                        'Continue with Google',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: screenWidth * 0.04, // Responsive font size
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => SignupScreen()); // ✅ Navigate to SignUp screen
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: Color(0xFFFF6700), // ✅ Orange color to match theme
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),



                            // Add extra space at bottom to ensure everything is visible when keyboard appears
                            SizedBox(height: screenHeight * 0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}