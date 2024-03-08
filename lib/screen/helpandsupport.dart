import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/paymentoption.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/common_container.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  List<String> data = [
    "How to Check status of My Order",
    "Change Items in My Order",
    "Cancel My Order",
    "Help with a Pick-up Order",
    "My Delivery Person made me Unsafe",
    "My Delivery Person made me Unsafe",
    "Change My delivery Address"
  ];
  bool showSubtitle = false;

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
                      Space.width(80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentOption()));
                        },
                        child: AppText(
                            appText: 'Help & Support',
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
          SizedBox(
            height: 600,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: ListTile(
                      title: AppText(
                          textAlign: TextAlign.start,
                          appText: data[index],
                          style: AppTextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black)),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == 0) {
                              showSubtitle = !showSubtitle;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                      subtitle: index == 0 && showSubtitle
                          ? const Text(
                              'Receive notification related to order status, payment and support '
                              'Aut haec tibi, Torquate, sunt vituperanda aut patrocinium voluptatis repudiandum. '
                              'Quod si ita se habeat, non possit beatam praestare vitam sapientia.',
                            )
                          : null,
                    ),
                  );
                }),
          ),
          Center(
            child: AppText(
                textAlign: TextAlign.center,
                appText: "Didn’t Found your Questions?",
                style: AppTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.splash472D2D)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: appBorderButton(btnText: 'ASK US FREETY'),
          ),
          Space.height(30),
          lastContainer(),
          Space.height(40),
        ],
      ),
    ));
  }
}
