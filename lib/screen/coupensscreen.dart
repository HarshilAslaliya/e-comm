import 'package:dotted_border/dotted_border.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration:
                        const BoxDecoration(color: ColorRes.blue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        children: [
                          Space.height(60),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                                Center(
                                  child: AppText(
                                      appText: 'Coupons',
                                      style: AppTextStyle(
                                          fontSize: 18,
                                          color: ColorRes.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MyAppSize.size275,
                            height: MyAppSize.size58,
                            child: AppTextField(
                              hintText: 'Enter Coupon Code',
                              fillColor: true,
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 21,
                                color: ColorRes.black,
                              ),
                            )),
                        Space.width(10),
                        Container(
                          height: MyAppSize.size55,
                          width: MyAppSize.size85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorRes.yellowFBA308),
                          child: Center(
                            child: AppText(
                                appText: 'APPLY',
                                style: AppTextStyle(
                                    fontSize: 15,
                                    color: ColorRes.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: 'Available Coupons',
                  style:
                      AppTextStyle(fontSize: 16, color: ColorRes.purple2B0752)),
            ),
            SizedBox(
              height: 800,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommomContainer(
                          height: 76,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorRes.whiteE8F1FF),
                              borderRadius: BorderRadius.circular(10))),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: AppText(
                            textAlign: TextAlign.start,
                            appText:
                                'Find Rs. 35 Off on Purchase of Cadcury Silk products worth Rs. 360 or More.',
                            style: AppTextStyle(
                                fontSize: 15,
                                color: ColorRes.grey696969,
                                fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Valid Once per customer  ",
                                  style: AppTextStyle(
                                      color: ColorRes.grey696969,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "View Details",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: AppTextStyle(
                                      color: ColorRes.purple2B0752,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            DottedBorder(
                                color: ColorRes.greyA0A4AB,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                dashPattern: [8, 4],
                                strokeWidth: 1,
                                child: Container(
                                  height: 36,
                                  width: MyAppSize.size150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: AppText(
                                        textAlign: TextAlign.center,
                                        appText: 'SILK35',
                                        style: AppTextStyle(
                                            fontSize: 15,
                                            color: ColorRes.grey696969,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                )),
                            Spacer(),
                            Container(
                              height: MyAppSize.size50,
                              width: MyAppSize.size150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorRes.blue),
                              child: Center(
                                child: AppText(
                                    textAlign: TextAlign.center,
                                    appText: 'APPLY',
                                    style: AppTextStyle(
                                        fontSize: 15,
                                        color: ColorRes.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Space.height(30),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: DottedBorder(
                  color: ColorRes.greyA0A4AB,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [8, 4],
                  strokeWidth: 1,
                  child: Container(
                    height: 36,
                    width: MyAppSize.size300,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: AppText(
                          textAlign: TextAlign.center,
                          appText: 'No Code Required',
                          style: AppTextStyle(
                              fontSize: 14,
                              color: ColorRes.yellowFBA308,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ),
            Space.height(20),
          ],
        ),
      ),
    );
  }
}
