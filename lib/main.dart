import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as Get;
import 'package:login_page/myapp.dart';
import 'package:login_page/src/services/app_bindings.dart';
import 'package:login_page/src/services/controllers/auth_controller.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';
import 'package:login_page/src/view/screens/gym_profile_screen.dart';
import 'package:login_page/src/view/screens/login_screen.dart';
import 'package:login_page/src/view/screens/member_profile_screen.dart';
import 'package:login_page/src/view/screens/signup_screen.dart';
import 'package:login_page/src/view/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensures Flutter is initialized
  prefs = await SharedPreferences.getInstance(); // ✅ Initialize SharedPreferences

  String? token = prefs.getString('auth_token');

  runApp(MyApp(isAuthenticated: token != null && token.isNotEmpty));
}

late SharedPreferences prefs;


class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({Key? key, required this.isAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      // home: isAuthenticated ? GymDashboardScreen() : LoginScreen(),
      // home: MyApp(isAuthenticated: false,),
      home: SplashScreen(),
    );
  }
}
