import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/homescreen.dart';
import 'package:electronics_app/screen/trackorder.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/utils/common_container.dart';

class SuccessFullyScreen extends StatefulWidget {
  const SuccessFullyScreen({super.key});

  @override
  State<SuccessFullyScreen> createState() => _SuccessFullyScreenState();
}

class _SuccessFullyScreenState extends State<SuccessFullyScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 142,
            width: MyAppSize.safeWidth,
            color: ColorRes.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space.height(50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: AppText(
                    appText: 'SUCCESSFULLY',
                    style: AppTextStyle(
                      fontSize: 18,
                      color: ColorRes.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Space.height(100),
          Image.asset(ImageRes.logo,height: 100,),
          Space.height(20),
          AppText(
              textAlign: TextAlign.center,
              appText: 'Your Order has Been\nAccepted',
              style: AppTextStyle(
                  fontSize: 24,
                  color: ColorRes.black,
                  fontWeight: FontWeight.bold)),
          Space.height(10),
          AppText(
              textAlign: TextAlign.center,
              appText:
                  'Your Items has Placed and is on its way to being\nProcessed.',
              style: AppTextStyle(
                  fontSize: 14,
                  color: ColorRes.grey696969,
                  fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: appBorderButton(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              btnText: 'Back to Home',
            ),
          ),
        ],
      ),
    );
  }
}
