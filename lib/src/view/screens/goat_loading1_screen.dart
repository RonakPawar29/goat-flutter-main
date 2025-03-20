import 'package:flutter/material.dart';
import 'add_member_screen.dart';

// Example of a main screen to navigate to


class GymLoaderScreen1no3 extends StatefulWidget {
  const GymLoaderScreen1no3({super.key});

  @override
  State<GymLoaderScreen1no3> createState() => _GymLoaderScreenState();
}

class _GymLoaderScreenState extends State<GymLoaderScreen1no3> {

  @override
  void initState() {
    super.initState();
    // Navigate to main screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   AddMembership()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
          
          clipBehavior: Clip.hardEdge,
          
        leading:  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/view-gym-room-training-sports 2.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.orange,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/Group 16.png"),
                        const Positioned(
                          top: 25,
                          child: Icon(
                            Icons.bolt,
                            size: 30,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 3,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

// Usage example:
