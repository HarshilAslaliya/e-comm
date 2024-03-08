import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/newaddress.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:flutter_svg/svg.dart';

class SelectBankScreen extends StatefulWidget {
  const SelectBankScreen({super.key});

  @override
  State<SelectBankScreen> createState() => _SelectBankScreenState();
}

class _SelectBankScreenState extends State<SelectBankScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(color: ColorRes.blue),
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
                                onTap:(){
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
                                              NewAddressScreen()));
                                },
                                child: Center(
                                  child: AppText(
                                      appText: 'SELECT BANK',
                                      style: AppTextStyle(
                                          fontSize: 18,
                                          color: ColorRes.white,
                                          fontWeight: FontWeight.bold)),
                                ),
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
                          width: MyAppSize.size290,
                          height: 58,
                          child: AppTextField(
                            hintText: 'Search your Groceries',
                            fillColor: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 21,
                              color: ColorRes.black,
                            ),
                          )),
                      Space.width(10),
                      Container(
                        height: 50,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorRes.white),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            ImageRes.sound,
                            height: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: AppText(
                appText: 'Popular Banks',
                style: AppTextStyle(
                    fontSize: 16,
                    color: ColorRes.purple2B0752,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: MyAppSize.size150,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20),
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      AppText(
                          appText: 'HDFC Bank',
                          style: AppTextStyle(
                              fontSize: 12,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: AppText(
                appText: 'All Banks',
                style: AppTextStyle(
                    fontSize: 20,
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold)),
          ),
          Space.height(20),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: AppText(
                appText: 'Airtel Payments Bank',
                style: AppTextStyle(
                    fontSize: 14,
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          Space.height(20),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: AppText(
                appText: 'Bank Of Baroda',
                style: AppTextStyle(
                    fontSize: 14,
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold)),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
