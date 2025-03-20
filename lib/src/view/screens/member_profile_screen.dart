import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_page/src/view/screens/upgrade_membership_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top portion with profile image, name and membership
          Container(
            color: Colors.black,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              children: [
                // Profile Image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/young-happy-athlete-using-mobile-phone-while-working-out-health-club 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Name
                const Text(
                  'Keshav Singh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Gold Member badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFD4AF37), Color(0xFFF5D773)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shield, size: 16, color: Colors.brown.shade800),
                      const SizedBox(width: 6),
                      Text(
                        'Gold Member',
                        style: TextStyle(
                          color: Colors.brown.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Remaining days
                Text(
                  '( 12 Days Remaining )',
                  style: TextStyle(
                   color: HexColor("FF6500"),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
          // White bottom section with details
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email
                  _buildInfoRow('Email', 'Keshavsingh420@gmail.com'),
                  const SizedBox(height: 16),
                  
                  // Address
                  _buildInfoRow('Address', '132-A Chintu Nagar'),
                  const SizedBox(height: 16),
                  
                  // Mobile No
                  _buildInfoRow('Mobile No', '7691918178'),
                  const SizedBox(height: 16),
                  
                  // Height and Weight in same row
                  Row(
                    children: [
                      Expanded(child: _buildInfoRow('Height', '184cm')),
                      const SizedBox(width: 20),
                      Expanded(child: _buildInfoRow('Weight', '75kg')),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Payment Details Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
 Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GymMembershipScreen (),
        ),
      );
                        
                      },
                      icon: const Icon(Icons.arrow_circle_right),
                      label: const Text('Payment Details'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("FF6500"),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Edit Profile and Upgrade Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Edit Profile'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: HexColor("FF6500"),),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Upgrade MS'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: HexColor("FF6500")),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label - ',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}