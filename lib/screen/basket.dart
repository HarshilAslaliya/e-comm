import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 142,
            width: MyAppSize.safeWidth,
            color: ColorRes.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Space.width(100),
                      AppText(
                          appText: 'Basket',
                          style: AppTextStyle(
                              color: ColorRes.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Space.height(90),
          SvgPicture.asset(ImageRes.basket2),
          Space.height(30),
          AppText(
              appText: 'Save for Later Items',
              style: AppTextStyle(
                  color: ColorRes.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          Space.height(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
                appText:
                    'Unavailable items from checkout will automatically apear here',
                style: AppTextStyle(
                    color: ColorRes.grey696969,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          Space.height(20),
        ],
      ),
    );
  }
}
