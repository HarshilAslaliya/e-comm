import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/searchproduct.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/categorydropdown.dart';

class ShopByCategoryScreen extends StatefulWidget {
  const ShopByCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ShopByCategoryScreen> createState() => _ShopByCategoryScreenState();
}

class _ShopByCategoryScreenState extends State<ShopByCategoryScreen> {
  late Stream<QuerySnapshot> _stream;
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('products').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          Space.height(30),
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
                                Space.width(50),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchProduct()));
                                  },
                                  child: AppText(
                                      appText: 'SHOP BY CATEGORY',
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
                            onChangedValue: (value) {
                              setState(() {
                                _searchText = value;
                              });
                            },
                            controller: _searchController,
                            hintText: 'Search your Groceries',
                            fillColor: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 21,
                              color: ColorRes.black,
                            ),
                          ),
                        ),
                        Space.width(10),
                        Container(
                          height: 50,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorRes.white,
                          ),
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
            Space.height(30),
            StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final List<String> categories = snapshot.data!.docs
                    .map((doc) => doc['category'] as String)
                    .toList();

                // Filter categories based on search text
                final List<String> filteredCategories = categories
                    .where((category) => category
                        .toLowerCase()
                        .contains(_searchText.toLowerCase()))
                    .toList();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: filteredCategories.map((category) {
                    final List<String> subcategories = snapshot.data!.docs
                        .where((doc) => doc['category'] == category)
                        .map((doc) => List<String>.from(doc['subcategory']))
                        .expand((element) => element)
                        .toList();

                    return CategoryDropdown(
                      categoryName: category,
                      subcategories: subcategories,
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
