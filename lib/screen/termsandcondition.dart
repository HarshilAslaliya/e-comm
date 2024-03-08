import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}


class _TermsAndConditionState extends State<TermsAndCondition> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // CollectionReference data =
  //     FirebaseFirestore.instance.collection('Terms&Conditions');
  //
  //
  // List<Map<String, String>> dataList = [
  //   {
  //     'title': 'General site usage last Revisited 12 Dec 202X',
  //     'description':
  //         'Receive notifications related to your order status, payments and support Aut haec tibi, Torquate, sunt vituperanda aut patrocinium voluptatis repudiandum. Quod si ita se habeat, non possit beatam praestare vitam sapientia.',
  //   },
  //   {
  //     'title': 'Agreement',
  //     'description':
  //         'Receive notifications related to your order status, payments and support Aut haec tibi, Torquate, sunt vituperanda aut patrocinium. Voluptatis repudiandum. Quod si ita se habeat, non possit beatam praestare vitam sapientia Aliter enim nosmet ipsos nosse non possumus.',
  //   },
  //   {
  //     'title': 'Account',
  //     'description':
  //         'Vim ingenii causamque iustam quovis conventu te omnia facere, ne doleas. Ratio enim nostra consentit pugnant Stoici beatam praestare vitam sapientia.',
  //   },
  //   {
  //     'title': 'Relationship with Electronics',
  //     'description':
  //         'Quaesita enim virtus est, non quae relinqueret naturam, sed quae tueretur. Pugnant Stoici cum Peripateticis. Ratio enim nostra consentit pugnant Stoici beatam praestare vitam sapientia.',
  //   },
  // ];
  //
  // void addDataToFirestore() async {
  //   try {
  //     await data.add({
  //       'list': dataList
  //           .map((e) => {'title': e['title'], 'description': e['description']})
  //           .toList(),
  //     });
  //     print('Data added to Firestore');
  //   } catch (e) {
  //     print('Error adding data to Firestore: $e');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   addDataToFirestore();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
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
                      Space.width(90),
                      AppText(
                          appText: 'Terms & Conditions',
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
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Terms&Conditions")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    List<Map<String, dynamic>> dataList =
                        List<Map<String, dynamic>>.from(
                            (snapshot.data!.docs[index].data()
                                as Map)['list']);
                    return Column(
                      children: dataList.map((map) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                              child: AppText(
                                textAlign: TextAlign.start,
                                appText: map['title'].toString(),
                                style: AppTextStyle(
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                              child: AppText(
                                textAlign: TextAlign.start,
                                appText: map['description'].toString(),
                                style: AppTextStyle(
                                    color: ColorRes.greyA0A4AB,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),),
                            ),                            ],
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
