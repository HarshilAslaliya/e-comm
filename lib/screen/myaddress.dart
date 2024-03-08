import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/faq.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/imageres.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 142,
            width: MyAppSize.safeWidth,
            color: ColorRes.blue,
            child: Column(
              children: [
                Space.height(80),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: ColorRes.white,
                        ),
                      ),
                      Space.width(80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FaqScreen()));
                        },
                        child: AppText(
                            appText: 'MY ADDRESS',
                            style: AppTextStyle(
                                color: ColorRes.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: ColorRes.whiteE8F1FF,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: ColorRes.purple2B0752,
                  ),
                  AppText(
                      appText: ' Add New Address',
                      style: AppTextStyle(
                          color: ColorRes.purple2B0752,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ],
              ),
            ),
          ),
          Space.height(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AppText(
                appText: 'Home',
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Space.height(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
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
                // Space.width(20),  Padding(
                //   padding: const EdgeInsets.only(bottom: 20.0),
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     decoration:
                //     BoxDecoration(border: Border.all(color: ColorRes.greyA0A4AB)),
                //),
                //)
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                ImageRes.icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
