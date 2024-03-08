import 'package:flutter/material.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/onboardingscreen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      },
    );
    _askPermission();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.splash472D2D,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(ImageRes.logo,height: 150,)),
        ],
      ),
    );
  }

  Future<void> _askPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Permission is granted.
      // You can now show notifications.
      print('Notification permission granted.');
    } else if (status.isDenied) {
      // Permission is denied.
      print('Notification permission denied.');
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied.
      // You need to take the user to the settings page to enable the permission manually.
      print('Notification permission permanently denied.');
    }
  }
}
