import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/main.dart';
import 'package:electronics_app/screen/locationmap.dart';
import 'package:electronics_app/screen/stepper.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

import 'package:flutter_svg/svg.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {



  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          },child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: ColorRes.white,
                          ),
                        ),
                        Space.width(90),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationMapScreen()));
                          },
                          child: AppText(
                              appText: 'TRACK ORDER',
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
              height: 90,
              color: ColorRes.whiteE8F1FF,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: ColorRes.blue,
                      ),
                    ),
                    Space.width(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            appText: 'DELIVERING TO HOME',
                            textAlign: TextAlign.center,
                            style: AppTextStyle(
                                color: ColorRes.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        AppText(
                            appText: '21, Rajainager, Bangaluru',
                            textAlign: TextAlign.center,
                            style: AppTextStyle(
                                color: ColorRes.purple2B0752,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppText(
                          appText: 'CHANGE',
                          textAlign: TextAlign.center,
                          style: AppTextStyle(
                              color: ColorRes.redF44831,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: 90,
              width: MyAppSize.safeWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorRes.whiteE8F1FF),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            appText: 'Order # 155643689',
                            textAlign: TextAlign.center,
                            style: AppTextStyle(
                                color: ColorRes.purple2B0752,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            AppText(
                                appText: 'Delivery Amount:',
                                textAlign: TextAlign.center,
                                style: AppTextStyle(
                                    color: ColorRes.grey505050,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.currency_rupee_outlined,
                              size: 20,
                            ),
                            AppText(
                                appText: '32.50',
                                textAlign: TextAlign.center,
                                style: AppTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        height: 32,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorRes.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: AppText(
                              appText: 'CANCEL',
                              textAlign: TextAlign.center,
                              style: AppTextStyle(
                                  color: ColorRes.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'ETA: 20 Minutes',
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Space.height(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: OrderTrackerZen(
                
                tracker_data: [
                  TrackerData(
                    title: "Order Place",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "Your Order has been place d Delivery on",
                        datetime: "30 Sep 2022",
                      ),

                    ],
                  ),
                  TrackerData(
                    title: "Items Processed",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "Your Order has been place d Delivery on",
                        datetime: "30 Sep 2022",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Delivery",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "Our Delivery Person are on Their way and Bring your Order.",
                        datetime: "",
                      ),

                    ],
                  ),  TrackerData(
                    title: "Shipping Delivered.",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "Expected at 02:05PM",
                        datetime: "",
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
