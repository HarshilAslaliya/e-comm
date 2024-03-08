import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/editprofile.dart';
import 'package:electronics_app/screen/privacypolicy.dart';
import 'package:electronics_app/screen/termsandcondition.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> data = ["Wallet", "Support", "Payments"];

  Map<String, dynamic> pro = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      pro = await fetchProfile() ?? {};
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    print(pro);
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MyAppSize.size410,
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
                                Space.width(115),
                                GestureDetector(
                                  onTap: () {},
                                  child: AppText(
                                      appText: 'MY PROFILE',
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
                  ),
                  Positioned(
                    top: 110,
                    right: 10,
                    left: 10,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.whiteE8F1FF),
                          borderRadius: BorderRadius.circular(10),
                          color: ColorRes.white),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Space.height(10),
                                Container(
                                  height: 84,
                                  width: 84,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: ColorRes.blue)),
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // border: Border.all(),
                                        color: ColorRes.greyD8D8D8),
                                  ),
                                ),
                                Space.height(10),
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
                                      return Column(
                                        children: [
                                          AppText(
                                              appText: '${data?["fname"]}',
                                              style: AppTextStyle(
                                                  fontSize: 18,
                                                  color: ColorRes.purple2B0752,
                                                  fontWeight: FontWeight.bold)),
                                          AppText(
                                              appText: '${data?["email"]}',
                                              style: AppTextStyle(
                                                  fontSize: 14,
                                                  color: ColorRes.grey696969,
                                                  fontWeight: FontWeight.w500)),
                                          Space.height(7),
                                          AppText(
                                              appText: '${data?["phone"]}',
                                              style: AppTextStyle(
                                                  fontSize: 16,
                                                  color: ColorRes.black,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      );
                                    }

                                    return CircularProgressIndicator();
                                  },
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: GestureDetector(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(
                                        phone: pro["phone"],
                                        name: pro["fname"],
                                        email: pro["email"],
                                        address: pro["address"],
                                      ),
                                    ),
                                  );

                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorRes.purple2B0752),
                                      borderRadius: BorderRadius.circular(40),
                                      color: ColorRes.whiteE8F1FF),
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  container("Wallet"),
                  container("Support"),
                  container("Payments"),
                ],
              ),
            ),

            Space.height(20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: ListTile(
                  leading: const Icon(Icons.reorder),
                  title: Text(
                    'My Orders',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: SvgPicture.asset(
                    ImageRes.down_arrow,
                    height: 10,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: ListTile(
                  leading: const Icon(Icons.eighteen_up_rating),
                  title: Text(
                    'My Ratings & Reviews',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: SvgPicture.asset(
                    ImageRes.down_arrow,
                    height: 10,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: ListTile(
                  leading: const Icon(Icons.notification_important_outlined),
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: SvgPicture.asset(
                    ImageRes.down_arrow,
                    height: 10,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: Text(
                    'My Delivery Address',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: SvgPicture.asset(
                    ImageRes.down_arrow,
                    height: 10,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicy(),
                    ),
                  );
                },
                child: ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndCondition(),
                    ),
                  );
                },
                child: ListTile(
                    leading: const Icon(Icons.question_mark),
                    title: Text(
                      'Terms & Conditions',
                      style: TextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  trailing: SvgPicture.asset(
                    ImageRes.down_arrow,
                    height: 10,
                  )),
            ),
            Space.height(20),
            lastContainer(),
            Space.height(20),
          ],
        ),
      ),
    );
  }

  Widget container(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 90,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: ColorRes.whiteE8F1FF),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Space.height(20),
            const Icon(Icons.wallet),
            Center(
              child: AppText(
                appText: title,
                style: AppTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: ColorRes.black),
              ),
            ),
          ],
        ),
      ),
    );
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
}
