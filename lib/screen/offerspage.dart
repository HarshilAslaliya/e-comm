import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/screen/homescreen.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Map<String, dynamic>> data = [
    {
      "image": ImageRes.of3,
      "title": "Chance to win FREE Nivea Product",
      "subtitle":
          "Aut haec tibi, Torquate, sunt vituperanda patrocinium tatis repudiandum vita corpus diceres pertinere."
    },
    {
      "image": ImageRes.of2,
      "title": "Rs. 15 Store has Arrived",
      "subtitle": "All top Selling products within Rs.15 for you."
    },
    {
      "image": ImageRes.of3,
      "title": "Super Sale is Activated",
      "subtitle": "All Deals Valid for 3 Hours Today. Happy Morning"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                                  builder: (context) => const HomeScreen()));
                        },
                        child: AppText(
                            appText: 'Offers',
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
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("offer").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Align(
                  alignment: Alignment.center,
                  child: const Text('Offer Not Available'),
                );
              } else {
                // Extract cart items from snapshot
                List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var offer = documents[index];
                    return Container(
                      height: MyAppSize.size290,
                      width: MyAppSize.safeWidth,
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              offer['image'],
                              fit: BoxFit.cover,
                              height: MyAppSize.size200,
                              width: MyAppSize.safeWidth,
                            ),
                            Space.height(10),
                            AppText(
                                textAlign: TextAlign.start,
                                appText: "${offer["name"]}",
                                style: AppTextStyle(
                                    fontSize: 17,
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.bold)),
                            Space.height(5),
                            AppText(
                                textAlign: TextAlign.start,
                                appText: "${offer["description"]}",
                                style: AppTextStyle(
                                    fontSize: 11,
                                    color: ColorRes.grey696969,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
