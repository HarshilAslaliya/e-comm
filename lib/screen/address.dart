import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedIndex = 0;

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
                      Space.width(130),
                      AppText(
                          appText: 'Address',
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
          Space.height(40),
          SizedBox(
            height: MyAppSize.size448,
            child: ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                        width: MyAppSize.safeWidth,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                      appText: 'GEORGE C.DIMAGGIO',
                                      style: AppTextStyle(
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  AppText(
                                      textAlign: TextAlign.start,
                                      appText:
                                          '4031 Haymond Rocks Road\n Medford, OR 9750',
                                      style: AppTextStyle(
                                          color: ColorRes.purple2B0752,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  AppText(
                                      appText: 'Mobile No: 541-494-5183',
                                      style: AppTextStyle(
                                          color: ColorRes.purple2B0752,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 58.0, top: 15),
                                child: index == selectedIndex
                                    ? Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: index == selectedIndex
                                                    ? ColorRes.blue
                                                    : ColorRes.greyB2B2B2,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              // border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: ColorRes.blue),
                                        ),
                                      )
                                    : Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorRes.greyB2B2B2,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: appBorderButton(btnText: 'ADD ADDRESS'),
          ),
          Space.height(40),
          Spacer(),
          lastContainer(),
          Space.height(40),
        ],
      ),
    );
  }
}
