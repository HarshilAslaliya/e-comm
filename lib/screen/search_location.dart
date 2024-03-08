import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/homescreen.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';

import 'package:flutter_svg/svg.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.height(50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: ColorRes.black,
              ),
            ),
            Space.height(40),
            AppText(
                appText: "Search for your Location",
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            Space.height(40),
            SizedBox(
                height: 58,
                child: AppTextField(
                    hintText: "Search for your Location",
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: ColorRes.black,
                    ))),
            Space.height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ImageRes.location,
                  height: 18,
                  width: 18,
                ),
                Space.width(10),
                AppText(
                    appText: "Use Current Location",
                    style: AppTextStyle(
                        color: ColorRes.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
                Space.width(20),
              ],
            ),
            Space.height(50),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: AppText(
                  appText: 'Home',
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Space.height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ImageRes.home,
                  height: 15,
                  width: 15,
                ),
                Space.width(50),
                AppText(
                    appText: "DELIVERING TO HOME",
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Space.width(20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    appText: "0.6km",
                    style: AppTextStyle(
                        color: ColorRes.purple2B0752,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Space.width(20),
                AppText(
                    appText: "21, Rajainager, Bangaluru",
                    style: AppTextStyle(
                        color: ColorRes.purple2B0752,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Space.width(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
