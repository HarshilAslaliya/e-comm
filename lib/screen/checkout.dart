import 'dart:ffi';

import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/constants/local_notifications.dart';
import 'package:electronics_app/main.dart';
import 'package:electronics_app/screen/successfully.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../services/total_controller.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  TotalController totalController = Get.put(TotalController());
  List<Map<String, dynamic>> cartItems = [];
  Map<String, dynamic> pro = {};
  double total  = 0.0;
  Future<void> _updateQuantity(String productId, int newQuantity) async {
    if (newQuantity >= 1) {
      try {
        await FirebaseFirestore.instance
            .collection('cartItem')
            .doc(productId)
            .update({'quantity': newQuantity});
      } catch (e) {
        // Handle error
        print('Error updating quantity: $e');
      }
    } else {
      print('Quantity cannot be less than 0');
    }
  }

  Future<void> fetchCartItems() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("cartItem").get();
      setState(() {
        cartItems = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
      totalController.total.value = 0.0;
      cartItems.forEach((element) {
        print(totalController.total);
        print(element["price"]);
        // print("${}");
        totalController.total.value = totalController.total.value + (double.parse(element["price"]) * element['quantity']);
      });
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }
  List<QueryDocumentSnapshot>? data;
  List AllOrder = [];
  List allData = [];
  List<Map<String, dynamic>> dataList = [];



  void getTotal()
  {

    totalController.total.value = 0.0;

    data?.forEach((element) {
      print(totalController.total);
      print(element["price"]);
      // print("${}");
      totalController.total.value = totalController.total.value + (double.parse(element["price"]) * element['quantity']);
    });
  }

  void addData(
      String imageUrl, String subcategory, String price, int quantity) {
    // setState(() {
    dataList.add({
      'imageUrl': imageUrl,
      'subcategory': subcategory,
      'price': price,
      'quantity': quantity,
    });
    print("----------------------------");
    print(dataList);
    // });
  }

  get() async {
    String uid = sharedPreferences.getString("uid") ?? "";
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection("orderPlaced")
        .doc("$uid")
        .get();
    Map<String, dynamic>? alldata = data.data();
    AllOrder = alldata?['order'] ?? [];
    print(AllOrder);
    setState(() {});
  }

  String uid = sharedPreferences.getString("uid") ?? "";

  void _setData() async {
    await get();
    print("------");
    print(dataList);
    print(AllOrder);
    print("------");

    String uid = sharedPreferences.getString("uid") ?? "";
    for (int i = 0; i < dataList.length; i++) {
      Map<String, dynamic> data = {
        "subcategory": dataList[i]['subcategory'],
        "imageUrls": dataList[i]['imageUrl'],
        "quantity": dataList[i]['quantity'],
        "price": dataList[i]['price'],
        "address": pro['address'],
        "name": pro['fname'],
        "phone": pro['phone'],
      };
      AllOrder.add(data);
    }
    await FirebaseFirestore.instance
        .collection("orderPlaced")
        .doc("$uid")
        .set({'order': AllOrder});
    dataList.clear();
    AllOrder.clear();

    try {
      final collectionRef = FirebaseFirestore.instance.collection("cartItem");
      final QuerySnapshot snapshot = await collectionRef.get();

      for (DocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessFullyScreen()),
      );

      print('Collection  cleared successfully.');
    } catch (e) {
      print('Error clearing collection: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchProfile() async {
    Map<String, dynamic>? subcategories = {};

    String uid = sharedPreferences.getString("uid") ?? "";
    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('ragisterUsers')
              .doc("$uid")
              .get();

      subcategories = querySnapshot.data();
    } catch (e) {
      print('Error fetching subcategories: $e');
    }

    return subcategories;
  }

  @override
  void initState() {
    super.initState();
    fetchCartItems();
    () async {
      pro = await fetchProfile() ?? {};
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    print(pro);
    // totalController.total.value = 0.0;
    MyAppSize().init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        color: const Color(0XFFE8F1FF),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: fetchProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    pro = data!;
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              height: 200,
                              color: Colors.transparent,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorRes.greyC4C4C4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Icon(
                                              Icons.payments,
                                              color: ColorRes.greyC4C4C4,
                                            ),
                                          ),
                                          Space.width(10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0),
                                            child: AppText(
                                              appText: 'Cash on Delivery',
                                              style: AppTextStyle(
                                                  color: ColorRes.grey505050,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      GestureDetector(
                                        onTap: () async {
                                          // dataList.clear();
                                          print("//////////////////////");

                                          print(dataList);
                                          //     print(snapshot.data!.docs);
                                          // var selectedProduct = documents;
                                          // print(selectedProduct);
                                          // dataList.add({
                                          //   'address': pro["address"],
                                          // });
                                          _setData();
                                          LocalNotifications.showSimpleNotification(
                                               title: "Electronics",
                                               body: "Order Confirm",
                                               payload: "This is periodic data",);
                                          //  CartItem.orderPlaced(dataList);
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 58,
                                          decoration: BoxDecoration(
                                            color: ColorRes.blue,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Continue',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w800,
                                                    height: 0.10,
                                                    letterSpacing: 0.20,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right,
                                                  size: 50,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 210,
                        height: 58,
                        decoration: BoxDecoration(
                          color: ColorRes.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PLACE ORDER',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  height: 0.10,
                                  letterSpacing: 0.20,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 50,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: ColorRes.white,
                              ),
                            ),
                            Space.width(90),
                            GestureDetector(
                              onTap: () {},
                              child: AppText(
                                  appText: 'CHECKOUT',
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
                  height: 94,
                  width: MyAppSize.safeWidth,
                  color: ColorRes.whiteE8F1FF,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee_outlined,
                              color: ColorRes.purple2B0752,
                              size: 20,
                            ),
                            Space.width(5),
                            AppText(
                              appText: 'Saved on this Order',
                              style: AppTextStyle(
                                  color: ColorRes.purple2B0752,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImageRes.persantage),
                            Space.width(5),
                            AppText(
                              appText: 'You Have FREE Delivery',
                              style: AppTextStyle(
                                  color: ColorRes.purple2B0752,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Space.height(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(ImageRes.checkoutcoupen),
                ),
                 StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("cartItem")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        return const Text('No items found in the cart.');
                      } else {
                        // Extract cart items from snapshot
                        List<QueryDocumentSnapshot> documents =
                            snapshot.data!.docs;
                         data = documents ;
                        return ListView.builder(
                          padding: const EdgeInsets.all(3),
                          itemCount: documents.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot<Object?> cartItem = documents[index];
                            List<Map<String, dynamic>> data = cartItems;

                            print(total);
                            print("--------");
                            print(data);
                            print(documents.length);


                            //

                            addData(
                                cartItem["imageUrls"],
                                cartItem["subcategory"],
                                cartItem["price"],
                                cartItem["quantity"]);
                            // allData.add(cartItem["imageUrls"]);
                            // allData.add(cartItem["subcategory"]);
                            // allData.add(cartItem["price"]);
                            // allData.add(cartItem["quantity"]);

                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: Color(0xFFF4F8FE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.height * 0.18,
                                        child: Container(
                                          margin: const EdgeInsets.all(15),
                                          height: 110,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorRes.greyC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            // Display the image of the cart item
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  cartItem["imageUrls"]),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Space.height(30),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              AppText(
                                                  appText:
                                                      cartItem["subcategory"],
                                                  // Use the subcategory field
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),),
                                              // If weight information is available in the cart item, use it h
                                            ],
                                          ),
                                          Space.height(10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Icon(Icons
                                                    .currency_rupee_outlined),
                                                AppText(
                                                    appText:
                                                        "${(int.parse(cartItem["price"].toString()) * cartItem['quantity']) }",
                                                    // Use the price field
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                          Space.height(10),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0.0),
                                            child: Container(
                                              height: 32,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorRes.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        // Decrement item count when tapping on the decrement icon
                                                        _updateQuantity(
                                                            cartItem.id,
                                                            cartItem['quantity'] -
                                                                1);
                                                        getTotal();
                                                        dataList.clear();

                                                      },
                                                      child: const Icon(
                                                          Icons.remove)),
                                                  AppText(
                                                      appText:
                                                          "${cartItem['quantity']}",
                                                      textAlign: TextAlign.center,
                                                      style: AppTextStyle(
                                                          color: ColorRes.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _updateQuantity(
                                                        cartItem.id,
                                                        cartItem['quantity'] + 1,
                                                      );
                                                      getTotal();
                                                      dataList.clear();

                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: ColorRes.black,
                                                      size: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 128.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                cartItem.reference.delete();
                                                dataList.clear();
                                                setState(() {});
                                              },
                                              // Call removeItem function when tapped
                                              child: AppText(
                                                appText: 'Remove',
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle(
                                                  color: ColorRes.redF44831,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],),
                                  )
                                ], // Your UI elements
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                Space.height(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(ImageRes.checkoutcoupen),
                ),
                Space.height(20),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: AppText(
                      appText: 'Add a Tips?',
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: AppText(
                      appText:
                          'All Tips are Directly Transferred to Delivery Partners.',
                      style: AppTextStyle(
                          color: ColorRes.grey505050,
                          fontWeight: FontWeight.bold,
                          fontSize: 11)),
                ),
                SizedBox(
                  height: 70,
                  // decoration: BoxDecoration(border: Border.all()),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            // border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorRes.whiteE8F1FF),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(ImageRes.smile),
                            Space.width(4),
                            const Icon(
                              Icons.currency_rupee_outlined,
                              size: 15,
                            ),
                            Space.width(4),
                            Center(
                              child: AppText(
                                  textAlign: TextAlign.center,
                                  appText: '15',
                                  style: AppTextStyle(
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Space.height(20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: AppText(
                      appText: 'Cancellation Policy',
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: AppText(
                      textAlign: TextAlign.start,
                      appText:
                          'Orders cannot be cancelled once packed for delivery. In case of unexpected deleys, a refund will be provided, if applicable.',
                      style: AppTextStyle(
                          color: ColorRes.grey505050,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
                Space.height(30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: AppText(
                      appText: 'Payment Details',
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                SizedBox(
                    height: MyAppSize.size200,
                    child: ListView.builder(
                      itemCount: 1,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  appText: 'Items Total',
                                  style: AppTextStyle(
                                      color: ColorRes.grey505050,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              const Spacer(),
                              const Icon(
                                Icons.currency_rupee_outlined,
                                size: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child:    Obx(() => AppText(
                                    appText: totalController.total.value.toString(),
                                    style: AppTextStyle(
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),)

                              ),



                            ],
                          ),
                        );
                      },
                    )),
                Space.height(40),
                Center(
                  child: Container(
                    height: 5,
                    width: 134,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorRes.grey979797),
                  ),
                ),
                Space.height(250),
              ],
            ),
          ),
          // Positioned(
          //   top: 600,
          //   child: Container(
          //     height: 200,
          //     width: MyAppSize.safeWidth,
          //     decoration: BoxDecoration(
          //         // border: Border.all(),
          //
          //         color: ColorRes.whiteE8F1FF),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 15.0,
          //       ),
          //       child: Column(
          //         children: [
          //           Space.height(40),
          //           Row(
          //             children: [
          //               const Icon(
          //                 Icons.location_on_outlined,
          //                 size: 25,
          //                 color: ColorRes.green45BC1B,
          //               ),
          //               Space.width(10),
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   AppText(
          //                       appText: 'DELIVERING TO HOME',
          //                       textAlign: TextAlign.center,
          //                       style: AppTextStyle(
          //                           color: ColorRes.black,
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold)),
          //                   AppText(
          //                       appText: '21, Rajainager, Bangaluru',
          //                       textAlign: TextAlign.center,
          //                       style: AppTextStyle(
          //                           color: ColorRes.purple2B0752,
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold)),
          //                 ],
          //               ),
          //               const Spacer(),
          //               AppText(
          //                   appText: 'CHANGE',
          //                   textAlign: TextAlign.center,
          //                   style: AppTextStyle(
          //                       color: ColorRes.redF44831,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.bold)),
          //             ],
          //           ),
          //           Space.height(10),
          //           const Divider(),
          //           Row(
          //             children: [
          //               Column(
          //                 children: [
          //                   Row(
          //                     children: [
          //                       const Icon(
          //                         Icons.payments_outlined,
          //                         size: 25,
          //                         color: ColorRes.green45BC1B,
          //                       ),
          //                       Space.width(8),
          //                       AppText(
          //                           appText: 'PAY USING',
          //                           textAlign: TextAlign.center,
          //                           style: AppTextStyle(
          //                               color: ColorRes.black,
          //                               fontSize: 14,
          //                               fontWeight: FontWeight.bold)),
          //                       Space.width(3),
          //                       const Icon(
          //                         Icons.arrow_drop_up_outlined,
          //                         size: 25,
          //                         color: ColorRes.black,
          //                       ),
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       AppText(
          //                           appText: 'Union Bank of India',
          //                           textAlign: TextAlign.center,
          //                           style: AppTextStyle(
          //                               color: ColorRes.purple2B0752,
          //                               fontSize: 14,
          //                               fontWeight: FontWeight.bold)),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //               Space.width(5),
          //               Column(
          //                 children: [
          //                   Container(
          //                     margin: const EdgeInsets.all(5),
          //                     padding: const EdgeInsets.all(7),
          //                     height: 58,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       // border: Border.all(),
          //                       color: ColorRes.green45BC1B,
          //                     ),
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         AppText(
          //                             appText: '\$84 \n Total',
          //                             textAlign: TextAlign.center,
          //                             style: AppTextStyle(
          //                                 color: ColorRes.white,
          //                                 fontSize: 14,
          //                                 fontWeight: FontWeight.w500)),
          //                         AppText(
          //                             appText: ' PLACE ORDER',
          //                             textAlign: TextAlign.center,
          //                             style: AppTextStyle(
          //                                 color: ColorRes.white,
          //                                 fontSize: 14,
          //                                 fontWeight: FontWeight.bold)),
          //                         const Icon(
          //                           Icons.arrow_forward_ios_rounded,
          //                           size: 20,
          //                           color: ColorRes.white,
          //                         ),
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }


}
