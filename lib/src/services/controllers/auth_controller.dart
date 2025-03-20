import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../api_endpoint.dart';
import '../models/auth_model.dart';

class AuthController extends GetxController {
  var isLoading = false.obs; // Reactive state for UI updates
  var authResponse = Rxn<AuthResponse>(); // Store API response

  // 🛠 Function to Register User
  Future<void> register(String gymName, String email, String password) async {
    isLoading.value = true;

    // ✅ Separate headers and body
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'gymName': gymName,
      'email': email,
      'password': password
    };

    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: headers,
        body: jsonEncode(body),
      );

      print("🔍 Register API Response: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        authResponse.value = AuthResponse.fromJson(responseData);

        // ✅ Save Token
        await _storeToken(authResponse.value!.token);
        await _storeGymId(authResponse.value!.gymId);
        Get.snackbar("Success", "Registration Successful", snackPosition: SnackPosition.BOTTOM);
      } else {
        _handleError(response);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // 🔑 Function to Login User
  Future<bool> login(String email, String password) async {
    isLoading.value = true;

    // ✅ Separate headers and body
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };


    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: headers,
        body: jsonEncode(body),
      );

      print("🔍 Login API Response: ${response.body} and status ${response.statusCode}");

      if (response.statusCode == 200) {
        final responseData = response.body;
        print("Api got called with status 200 data : ${responseData}");
        authResponse.value = AuthResponse.fromJson(responseData);
        print("is profile complete : ${authResponse.value!.isProfileCompleted}");

        // ✅ Save Token
        await _storeToken(authResponse.value!.token);
        await _storeGymId(authResponse.value!.gymId);

        Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.BOTTOM);
        return true;
      } else {

        _handleError(response);
        return false;
      }
    } catch (e) {
      print("This Is The Error $e");

      Get.snackbar("Error : $e", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);

      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // 🔐 Store Token in SharedPreferences
  Future<void> _storeToken(String? token) async {
    if (token != null && token.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      print("✅ Token Saved: $token");
    }
  }
  Future<void> _storeGymId(String? gymId) async{
    if (gymId != null && gymId.isNotEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString("gym_id", gymId.trim());
      print("✅ Gym Id Saved: $gymId");
    }


  }
  Future<void> _storeGymName(String? gymName) async {
    if (gymName != null && gymName.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('gym_name', gymName);
      print("✅ Gym Name Saved: $gymName");
    }
  }

  // 🔍 Retrieve Token
  Future<String?> getToken() async {
    return prefs.getString('auth_token');
  }

  // ⚠ Handle API Errors
  void _handleError(http.Response response) {
    String errorMessage = "Something went wrong";
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      errorMessage = responseData['message'] ?? errorMessage;
    } catch (_) {
      errorMessage = response.reasonPhrase ?? errorMessage;
    }
    Get.snackbar("Error", errorMessage, snackPosition: SnackPosition.BOTTOM);
  }
}
