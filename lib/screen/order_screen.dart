import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/main.dart';
import 'package:electronics_app/utils/app_text.dart';

import 'package:flutter_svg/svg.dart';

import '../constants/imageres.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String uid = sharedPreferences.getString("uid") ?? "";

  List dataList = [];
  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  get() async {
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection("orderPlaced")
        .doc("$uid")
        .get();

    dataList = data.data()?['order'];
    print(dataList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        centerTitle: true,
        title: AppText(
          appText: 'Order',
          style: AppTextStyle(
            color: ColorRes.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.all(3),
          itemCount: dataList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 142,
              margin: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xFFF4F8FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 135,
                        width: 135,
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: 144,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorRes.greyC4C4C4),
                            borderRadius: BorderRadius.circular(20),
                            // Display the image of the cart item
                            image: DecorationImage(
                              image: NetworkImage(
                                  dataList[index]["imageUrls"].toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Space.height(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Space.width(10),
                            AppText(
                                appText:
                                    dataList[index]["subcategory"].toString(),
                                // Use the subcategory field
                                textAlign: TextAlign.center,
                                style: AppTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Space.width(20),
                            // If weight information is available in the cart item, use it here

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(Icons.currency_rupee_outlined,size: 20,),
                                  AppText(
                                      appText:
                                          dataList[index]["price"].toString(),
                                      // Use the price field
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(
                                          color: ColorRes.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                height: 32,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorRes.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AppText(
                                      appText: dataList[index]['quantity']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(
                                          color: ColorRes.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  dataList.removeAt(index);
                                  setState(() {});
                                  await FirebaseFirestore.instance
                                      .collection("orderPlaced")
                                      .doc("$uid")
                                      .set({'order': dataList});
                                  get();
                                },
                                child: Container(
                                  width: 60,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      appText: 'Cancel',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(
                                        color: ColorRes.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                  ),
                ], // Your UI elements
              ),
            );
          },
        ),
      ),
    );
  }
}
