import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:login_page/src/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _videoController; // ✅ Nullable bana diya

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _videoController = VideoPlayerController.asset("assets/GoatSplash.mp4")
        ..initialize().then((_) {
          setState(() {});
          _videoController?.play();
        }).catchError((e) {
          debugPrint("❌ Error initializing video: $e");
        });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LoginScreen());
    });
  }

  @override
  void dispose() {
    _videoController?.dispose(); // ✅ Null check lagaya
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: (_videoController != null && _videoController!.value.isInitialized)
            ? AspectRatio(
          aspectRatio: _videoController!.value.aspectRatio,
          child: VideoPlayer(_videoController!),
        )
            : const CircularProgressIndicator(color: Colors.orange), // ✅ No crash
      ),
    );
  }
}
