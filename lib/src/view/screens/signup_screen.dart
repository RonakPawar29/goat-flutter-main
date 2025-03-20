import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/src/view/screens/Custom_Button.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';
import '../../services/controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  final TextEditingController gymNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
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
                // Background Image
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

                // Bottom white card with sign-up form
                Positioned(
                  top: screenHeight * 0.45,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 0.8, // ✅ Increased height to fit all elements
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
                    child: SingleChildScrollView( // ✅ Ensures full visibility
                      physics: ClampingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: screenHeight * 0.0001,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // ✅ Makes Column take only necessary space
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: screenHeight*0.01,),
                            // SIGN UP text
                            Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Color(0xFFFF6700),
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.045),

                            // Gym Name input
                            _buildInputField(
                              controller: gymNameController,
                              hintText: "Gym Name",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                            SizedBox(height: screenHeight * 0.025),

                            // Email input
                            _buildInputField(
                              controller: emailController,
                              hintText: "Enter Email Address",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: screenHeight * 0.025),

                            // Password input
                            _buildInputField(
                              controller: passwordController,
                              hintText: "Password",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            SizedBox(height: screenHeight * 0.025),

                            // Submit button
                            CustomButton(
                              text: "SUBMIT",
                              onPressed: () async {
                                print("Submit button pressed");

                                setState(() {
                                  isLoading = true;
                                });

                                // Validate input fields
                                if (gymNameController.text.trim().isEmpty ||
                                    emailController.text.trim().isEmpty ||
                                    passwordController.text.isEmpty) {
                                  Get.snackbar("Error", "All fields are required",
                                      snackPosition: SnackPosition.BOTTOM);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  return;
                                }

                                try {
                                  // Call sign-up API
                                  final success = await authController.register(
                                    gymNameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text,
                                  );
                                  
                                   if ( isLoading ) {
                                  print("Sign In Successfully");
                                  Get.off(() => GymDashboardScreen());; // ✅ Replaces login screen
                                }
                                } catch (e) {
                                  Get.snackbar("Error", "Registration failed: ${e.toString()}",
                                      snackPosition: SnackPosition.BOTTOM);
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                            ),

                            SizedBox(height: screenHeight * 0.02),

                            // Google Sign-In Button
                            Container(
                              height: screenWidth * 0.10,
                              width: screenWidth * 0.6,
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
                                        SizedBox(width: screenWidth * 0.02),

                                        // Text container
                                        Text(
                                          'Continue with Google',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Already have an account? Login
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "   Already have an account?",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back(); // This will navigate back to login screen
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: Color(0xFFFF6700),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: screenHeight * 0.02), // Extra spacing to prevent cutoff
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Loading indicator
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6700)),
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

  /// Custom Input Field
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required double screenWidth,
    required double screenHeight,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      width: screenWidth * 0.85,
      height: screenHeight * 0.055,
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: screenHeight * 0.016,
            ),
          ),
        ),
      ),
    );
  }
}