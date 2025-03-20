import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/src/view/screens/add_member_screen.dart';
import 'package:login_page/src/view/screens/member_profile_screen.dart';
import 'package:login_page/src/view/screens/gym_profile_screen.dart';
import '../../helpers/app_colors.dart';
import '../../services/controllers/dashboard_controller.dart';

class GymDashboardScreen extends StatelessWidget {
  const GymDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final DashboardController controller = Get.put(DashboardController());

    // Mock data for income
    final int monthlyIncome = 145000;
    // Mock data for active members (slightly less than total)
    final activeMembers = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with logo and title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Gold Gym',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          color: AppColors.primaryTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GymInfoScreen()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Statistics section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // Total members
                  SizedBox(
                    width: 250, // Fixed width for consistency
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          // Left Section (Image + Text)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/totalmembers.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Total Members',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Right Section (Number with White Background, Touching Border)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Obx(() => Text(
                              '${controller.memberCount.value}',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10), // Adds space between containers

                  // Active Members
                  SizedBox(
                    width: 250, // Ensures same width
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          // Left Section (Image + Text)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/activemembers.png', // Your PNG image
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Active Members',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Right Section (Number with White Background, Touching Border)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              '$activeMembers',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Monthly income
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/monthly_income.png"),
                          const Text(
                            'Monthly Income',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Changa',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              border: Border(
                                left: BorderSide(color: Colors.white, width: 1.5),  // Left border
                                right: BorderSide(color: Colors.white, width: 1.5), // Right border
                                bottom: BorderSide(color: Colors.white, width: 1.5),// Bottom border
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Spacing inside the border
                            child: Text(
                              '₹ $monthlyIncome',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add member button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: 170,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddMembership()),
                      ).then((_) {
                        // Refresh data when returning from add member screen
                        controller.fetchDashboardData();
                      });
                    },
                    label: const Text('Add Member'),
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 123, 255, 1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Client list
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Your',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Members',
                              style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 25,
                                fontFamily: "Changa",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // List Section (Now Visible & Scrollable) with Empty State
                    Expanded(
                      child: Obx(() => controller.membersList.isEmpty
                          ? _buildEmptyState()
                          : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.membersList.length,
                        itemBuilder: (context, index) {
                          final member = controller.membersList[index];
                          return InkWell(
                            onTap: () => _viewMemberDetails(context, member),
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    // Client Image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        "assets/young-happy-athlete-using-mobile-phone-while-working-out-health-club 1.png",
                                        width: 70,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    // Client Details
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            member['name'] ?? 'Unknown Member',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'Member Since ${_formatMemberSince(member['createdAt'])}',
                                            style: TextStyle(
                                              color: Colors.blue.shade600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Height & Weight
                                    Text(
                                      'H: ${member['height'] ?? '0'}cm W: ${member['weight'] ?? '0'}kg',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  // Empty state widget when no members
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            "No Members Yet",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Add your first gym member using the 'Add Member' button",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 16),
          
        ],
      ),
    );
  }

  // Format createdAt date to a simple "X Years" or "X Months" format
  String _formatMemberSince(String? createdAt) {
    if (createdAt == null) return "New";

    try {
      final DateTime joinDate = DateTime.parse(createdAt);
      final DateTime now = DateTime.now();
      final Duration difference = now.difference(joinDate);

      final int years = (difference.inDays / 365).floor();
      final int months = (difference.inDays / 30).floor();

      if (years > 0) {
        return "$years ${years == 1 ? 'Year' : 'Years'}";
      } else if (months > 0) {
        return "$months ${months == 1 ? 'Month' : 'Months'}";
      } else {
        return "${difference.inDays} ${difference.inDays == 1 ? 'Day' : 'Days'}";
      }
    } catch (e) {
      return "New";
    }
  }

  void _viewMemberDetails(BuildContext context, Map<String, dynamic> member) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              member['name'] ?? 'Unknown Member',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Member Since: ${_formatMemberSince(member['createdAt'])}'),
            Text('Height: ${member['height'] ?? 'N/A'}cm'),
            Text('Weight: ${member['weight'] ?? 'N/A'}kg'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Sending message to ${member['name']}'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.message),
                    label: const Text('Message'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);

                      // Show update form
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Update Member'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: const OutlineInputBorder(),
                                    hintText: member['name'],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Height (cm)',
                                    border: const OutlineInputBorder(),
                                    hintText: member['height']?.toString() ?? '',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Weight (kg)',
                                    border: const OutlineInputBorder(),
                                    hintText: member['weight']?.toString() ?? '',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // In real app, update the member in API
                                // Then refresh the dashboard data
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Member updated successfully')),
                                );
                              },
                              child: const Text('Update'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}