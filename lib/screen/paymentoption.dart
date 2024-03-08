import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/addnewcard.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
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
                                  builder: (context) => const AddNewCard()));
                        },
                        child: AppText(
                            appText: 'Payment Options',
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(ImageRes.CARD,width: MyAppSize.safeWidth,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'Other Payment Option',
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Space.height(30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
            ),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'Paypal',
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'mypaypal@gmail.com',
                style: AppTextStyle(
                    color: ColorRes.grey696969,
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
          Space.height(30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
            ),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'Cash On Delivery',
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'Pay in Cash',
                style: AppTextStyle(
                    color: ColorRes.grey696969,
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
          Space.height(30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
            ),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'ApplePay',
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'applepay.com',
                style: AppTextStyle(
                    color: ColorRes.grey696969,
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
        ],
      ),
    ));
  }
}
