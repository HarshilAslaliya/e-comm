import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/fruitsandvegitables.dart';
import 'package:electronics_app/screen/shopbycatagory.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import '../utils/app_text.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
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
              height: MyAppSize.size200,
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
                        children: [
                          Space.height(30),
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
                                Space.width(50),
                                GestureDetector(
                                  // onTap:(){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) =>FruitsAndVegeitablesScreen() ));
                                  // },
                                  child: AppText(
                                      appText: 'SEARCH PRODUCTS',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: 'Popular Searches',
                  style: AppTextStyle(
                      fontSize: 16,
                      color: ColorRes.purple2B0752,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 36,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: ColorRes.greyE6E6E6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline_outlined,
                    color: ColorRes.black,
                  ),
                  Space.width(
                    10,
                  ),
                  AppText(
                      appText: 'Rice',
                      style: AppTextStyle(
                          fontSize: 15,
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Space.height(20),
            Container(
              height: MyAppSize.size748,
              width: MyAppSize.safeWidth,
              // decoration: BoxDecoration(border: Border.all()),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 151,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    height: 151,
                    width: 300,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: ColorRes.whiteE8F1FF),
                        ),
                        Expanded(
                          child: AppText(
                              appText: 'Suger',
                              textAlign: TextAlign.center,
                              style: AppTextStyle(
                                  color: ColorRes.purple2B0752,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
