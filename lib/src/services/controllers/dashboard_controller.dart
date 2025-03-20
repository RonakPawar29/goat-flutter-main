import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoint.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var memberCount = 0.obs;
  var membersList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? gymId = prefs.getString('gym_id');
      if (gymId == null) {
        Get.snackbar("Error", "Gym ID not found", snackPosition: SnackPosition.BOTTOM);
        return;
      }

      await Future.wait([
        fetchMemberCount(gymId),
        fetchMembersByGymId(gymId),
      ]);
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMemberCount(String gymId) async {
    try {
      final response = await http.get(Uri.parse("${ApiEndpoints.baseUrl}/api/v1/goat/members/countByGymId/$gymId"));
      print("🔍 Member Count API Response: ${response.body}");
      if (response.statusCode == 200) {
        memberCount.value = int.parse(response.body);
      } else {
        _handleError(response);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> fetchMembersByGymId(String gymId) async {
    try {
      final response = await http.get(Uri.parse("${ApiEndpoints.baseUrl}/api/v1/goat/members/byGymId/$gymId"));
      print("🔍 Members List API Response: ${response.body}");
      if (response.statusCode == 200) {
        membersList.value = jsonDecode(response.body);
      } else {
        _handleError(response);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

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
