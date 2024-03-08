import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/main.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.address});

  final String name;
  final String email;
  final String phone;
  final String address;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? email;
  TextEditingController? name;
  TextEditingController? phone;
  TextEditingController? address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    email = TextEditingController(text: widget.email);
    name = TextEditingController(text: widget.name);
    phone = TextEditingController(text: widget.phone);
    address = TextEditingController(text: widget.address);
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MyAppSize.size970,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration:
                        const BoxDecoration(color: ColorRes.blue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Space.height(50),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                                AppText(
                                  appText: 'EDIT PROFILE',
                                  style: AppTextStyle(
                                      fontSize: 18,
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 10,
                    left: 10,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: MyAppSize.safeWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.whiteE8F1FF),
                          borderRadius: BorderRadius.circular(10),
                          color: ColorRes.white),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Space.height(10),
                                AppText(
                                    appText: 'First Name*',
                                    style: AppTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.grey696969,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      hintText: "Macro",
                                      hintStyle: AppTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: ColorRes.black)),
                                ),
                                Space.height(20),
                                AppText(
                                    appText: 'Phone Number*',
                                    style: AppTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.grey696969,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: phone,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "(+1) 662-789-9818",
                                      hintStyle: AppTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: ColorRes.black)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    left: 10,
                    right: 10,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: MyAppSize.safeWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.whiteE8F1FF),
                          borderRadius: BorderRadius.circular(10),
                          color: ColorRes.white),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Space.height(20),
                                AppText(
                                    appText: 'Email',
                                    style: AppTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.grey696969,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: email,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintStyle: AppTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: ColorRes.black)),
                                ),
                                Space.height(20),
                                AppText(
                                    appText: 'Address',
                                    style: AppTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.grey696969,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: address,
                                  decoration: InputDecoration(
                                      hintStyle: AppTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: ColorRes.black)),
                                ),
                                Space.height(20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 550,
                    left: 10,
                    right: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: appBorderButton(
                        onTap: () async {
                          CollectionReference db = FirebaseFirestore.instance
                              .collection("ragisterUsers");
                          print("k");
                          Map<String, dynamic> k = {
                            'email': email!.text,
                            'fname': name!.text,
                            'phone': phone!.text,
                            'address': address!.text,
                          };
                          print("k");
                          String uid = sharedPreferences.getString("uid") ?? "";
                          print("k");
                          await db.doc("$uid").set(k);

                          Navigator.pop(context);
                        },
                        btnText: 'SAVE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
