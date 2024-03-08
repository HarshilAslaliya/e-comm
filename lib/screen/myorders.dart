import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/orderstepper.dart';
import 'package:electronics_app/screen/review.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:easy_stepper/easy_stepper.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MyAppSize.size210,
              child: Stack(children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(color: ColorRes.blue),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Space.height(50),
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
                              Space.width(80),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReviewScreen()));
                                },
                                child: AppText(
                                    appText: 'MY ORDER',
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
                  top: 110,
                  right: 10,
                  left: 10,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 60,
                    width: MyAppSize.safeWidth,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorRes.whiteE8F1FF),
                        borderRadius: BorderRadius.circular(10),
                        color: ColorRes.white),
                    child: const SizedBox(
                      height: 60,
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: TabBar(
                          labelColor: ColorRes.blue,
                          indicatorColor: ColorRes.blue,
                          unselectedLabelColor: ColorRes.black,
                          indicatorPadding: EdgeInsets.only(bottom: 15),
                          tabs: [
                            Tab(
                              text: "ALL",
                            ),
                            Tab(
                              text: "RUNNING",
                            ),
                            Tab(
                              text: "PREVIOUS",
                            ),
                          ],
                        ),
                      ), // ,),
                    ),
                  ),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MyAppSize.size160,
              width: MyAppSize.safeWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.whiteE8F1FF, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height(10),
                  Row(
                    children: [
                      Space.width(10),
                      AppText(
                          appText: 'Order ID:',
                          style: AppTextStyle(
                              fontSize: 15,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Space.width(10),
                      AppText(
                          appText: '546789685432',
                          style: AppTextStyle(
                              fontSize: 18,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AppText(
                            appText: '24 Oct',
                            style: AppTextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: horizontalSteeper(status: 'Processing'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: AppText(
                        appText: 'Processing',
                        style: AppTextStyle(
                            fontSize: 12,
                            color: ColorRes.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MyAppSize.size190,
              width: MyAppSize.safeWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.whiteE8F1FF, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height(25),
                  Row(
                    children: [
                      Space.width(10),
                      AppText(
                          appText: 'Order ID:',
                          style: AppTextStyle(
                              fontSize: 15,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Space.width(10),
                      AppText(
                          appText: '546789685432',
                          style: AppTextStyle(
                              fontSize: 18,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AppText(
                            appText: '24 Oct',
                            style: AppTextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Space.height(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: horizontalSteeper(status: 'delivery'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: AppText(
                        appText: 'Delivery',
                        style: AppTextStyle(
                            fontSize: 12,
                            color: ColorRes.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MyAppSize.size190,
              width: MyAppSize.safeWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.whiteE8F1FF, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height(25),
                  Row(
                    children: [
                      Space.width(10),
                      AppText(
                          appText: 'Order ID:',
                          style: AppTextStyle(
                              fontSize: 15,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Space.width(10),
                      AppText(
                          appText: '546789685432',
                          style: AppTextStyle(
                              fontSize: 18,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AppText(
                            appText: '24 Oct',
                            style: AppTextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Space.height(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: horizontalSteeper(status: 'Stepped'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: AppText(
                        appText: 'Stepped',
                        style: AppTextStyle(
                            fontSize: 12,
                            color: ColorRes.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
