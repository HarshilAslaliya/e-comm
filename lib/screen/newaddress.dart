import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/coupensscreen.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  List<String> data=["HOME","OFFICE","OTHER"];
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
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
                                        CouponsScreen()));
                          },
                          child: AppText(
                              appText: 'NEW ADDRESS',
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: 'Personal Details',
                  style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorRes.black)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(children: [
                AppText(
                    appText: 'Enter First Name',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
                Space.width(70),
                AppText(
                    appText: 'Enter Last Name',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
              ]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Jennifer",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "R. Galindo",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                )
              ],
            ),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'Contact Number to say hello',
                  style: AppTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.grey696969)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "(+1) 303-324-7495",
                    hintStyle: AppTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorRes.black)),
              ),
            ),
            Space.height(10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: 'Address Details',
                  style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorRes.black)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(children: [
                AppText(
                    appText: 'House No',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
                Space.width(120),
                AppText(
                    appText: 'Apartment Name',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
              ]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Jennifer",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "R. Galindo",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                )
              ],
            ),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'Street Details',
                  style: AppTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.grey696969)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextFormField(),
            ),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'Area Details',
                  style: AppTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.grey696969)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Anna Nagar Chennai - 600040",
                    hintStyle: AppTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorRes.black)),
              ),
            ),
            Space.height(20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(children: [
                AppText(
                    appText: 'City / District',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
                Space.width(70),
                AppText(
                    appText: 'Pincode',
                    style: AppTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorRes.grey696969)),
              ]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Chennai",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "600040",
                          hintStyle: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorRes.black)),
                    ),
                  ),
                )
              ],
            ),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'Choose Nick Name for This Address',
                  style: AppTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.grey696969)),
            ),
            Space.height(20),
            SizedBox(
                height: 50,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      height: 42,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.grey696969),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: AppText(
                            appText: data[index],
                            style: AppTextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: ColorRes.grey696969)),
                      ),
                    );
                  },
                )),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AppText(
                  appText: 'Nick Name this Address as',
                  style: AppTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.grey696969)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextFormField(),
            ),
            Space.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: appBorderButton(btnText: 'ADD ADDRESS'),
            ),
            Space.height(40),
           lastContainer(),
            Space.height(30),
          ],
        ),
      ),
    );
  }
}
