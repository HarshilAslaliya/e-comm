import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  bool isOn = false;

  void On(bool value) {
    if (isOn == false) {
      setState(() {
        isOn = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isOn = false;
      });
      print('Switch Button is OFF');
    }
  }

  bool isOff = false;

  void Off(bool value) {
    if (isOff == false) {
      setState(() {
        isOff = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isOff = false;
      });
      print('Switch Button is OFF');
    }
  }

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
                      GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const StartShoppingScreen()));
                        // },
                        child: AppText(
                            appText: 'NOTIFICATIONS',
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
          Space.height(20),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AppText(
                    appText: 'Order and Support',
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                    textAlign: TextAlign.start,
                    appText:
                        'Receive notifications related to \nyour order status, payments \nand support communications',
                    style: AppTextStyle(
                        color: ColorRes.greyA0A4AB,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 20,
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: ColorRes.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Space.height(20),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AppText(
                    appText: 'Offers',
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                    textAlign: TextAlign.start,
                    appText:
                        'Receive notifications related to\n your order status, payments \nand support communications',
                    style: AppTextStyle(
                        color: ColorRes.greyA0A4AB,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 20,
                    child: Switch(
                      onChanged: Off,
                      value: isOff,
                      activeColor: ColorRes.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Space.height(20),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AppText(
                    appText: 'Promotions and New Launches',
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    textAlign: TextAlign.start,
                    appText:
                        'Receive Update on new brands, \n   feedback on new products \n services.',
                    style: AppTextStyle(
                        color: ColorRes.greyA0A4AB,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 20,
                    child: Switch(
                      onChanged: On,
                      value: isOn,
                      activeColor: ColorRes.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
