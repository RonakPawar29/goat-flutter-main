

import 'package:flutter/material.dart';
import 'package:login_page/src/view/screens/add_member_screen.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';
import 'package:login_page/src/view/screens/login_screen.dart';
import 'package:login_page/src/view/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _getInitialScreen(), // ✅ Decide initial screen based on stored token
    );
  }

  Widget _getInitialScreen() {
    String? token = prefs.getString('auth_token'); // ✅ Check stored token
    if (token != null && token.isNotEmpty) {
      return GymDashboardScreen(); // ✅ If logged in, go to Dashboard
    } else {
      return AddMembership(); // ✅ Otherwise, show Login screen
    }
    // return LoginScreen(); // ✅ Otherwise, show Login screen

  }
}
