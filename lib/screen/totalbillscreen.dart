import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/selectbank.dart';
import 'package:electronics_app/utils/app_text.dart';

class TotalBillScreen extends StatefulWidget {
  const TotalBillScreen({super.key});

  @override
  State<TotalBillScreen> createState() => _TotalBillScreenState();
}

class _TotalBillScreenState extends State<TotalBillScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
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
                      Space.width(70),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectBankScreen(),
                            ),
                          );
                        },
                        child: AppText(
                            appText: 'BILL TOTAL',
                            style: AppTextStyle(
                                color: ColorRes.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 4.0),
                      //   child: Icon(
                      //     Icons.currency_rupee_outlined,
                      //     size: 20,
                      //     color: ColorRes.white,
                      //   ),
                      // ),
                      // AppText(
                      //   appText: '0',
                      //   style: AppTextStyle(
                      //     color: ColorRes.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Space.height(40),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: AppText(
                appText: "Pay On Delivery",
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          SizedBox(
              height: MyAppSize.size300,
              child: ListView.builder(
                itemCount: 1,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorRes.greyC4C4C4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.payments,
                            color: ColorRes.greyC4C4C4,
                          ),
                        ),
                        Space.width(10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: AppText(
                              appText: 'Cash on Delivery',
                              style: AppTextStyle(
                                  color: ColorRes.grey505050,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorRes.black,
                          size: 20,
                        ),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
