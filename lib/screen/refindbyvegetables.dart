import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/singleproductpage.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';

class RefineByVegetablesScreen extends StatefulWidget {
  const RefineByVegetablesScreen({super.key});

  @override
  State<RefineByVegetablesScreen> createState() =>
      _RefineByVegetablesScreenState();
}

class _RefineByVegetablesScreenState extends State<RefineByVegetablesScreen> {
  List data = ["Refine By", "Sort By"];
  List approveData = ["Cancel All", "Apply"];
  int SelectedIndex = 0;
  int value = 0;
  List<String> valueList = [
    "Popularity",
    "Price - Low to High",
    "Price - High to Low",
    "Alphabetical",
    "Off - High to Low"
  ];
  List<int> integerValueList = [0, 1, 2, 3, 4];
  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        const Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: ColorRes.white,
                        ),
                        Space.width(50),
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>SingleProductPage() ));
                          },
                          child: AppText(
                              appText: 'FRESH VEGETABLES',
                              style: AppTextStyle(
                                  fontSize: 18,
                                  color: ColorRes.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.search,
                          size: 28,
                          color: ColorRes.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Space.height(20),
            Container(
              color: ColorRes.whiteF5F5F5,
              child: SizedBox(
                height: MyAppSize.size65,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 56,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: SelectedIndex == index
                                    ? ColorRes.blue
                                    : ColorRes.whiteE8F1FF),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorRes.whiteE8F1FF),
                        child: Center(
                            child: AppText(
                                appText: data[index],
                                style: AppTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                    );
                  },
                ),
              ),
            ),
            SelectedIndex == 0
                ? Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MyAppSize.size210,
                          child: ListView.builder(
                            itemCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppText(
                                            appText: 'Brand',
                                            textAlign: TextAlign.start,
                                            style: AppTextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: ColorRes.black)),
                                        Spacer(),
                                        SvgPicture.asset(
                                          ImageRes.down_arrow,
                                          height: 10,
                                        ),
                                        Space.width(20),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MyAppSize.size450,
                          child: ListView.builder(
                            itemCount: valueList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: RadioListTile<int>(
                                        activeColor: ColorRes.blue,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                        title: AppText(
                                            appText: valueList[index],
                                            textAlign: TextAlign.start,
                                            style: AppTextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: ColorRes.black,
                                            )),
                                        value: integerValueList[index],
                                        groupValue: value,
                                        onChanged: (selectedValue) {
                                          setState(() {
                                            value = selectedValue!;
                                            print(
                                                'radio button value present $value');
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: ColorRes.blue,
                      // Note the correct camel casing
                      disabledColor:
                          ColorRes.blue, // Note the correct camel casing
                    ),
                    child: SizedBox(
                      height: MyAppSize.size450,
                      child: ListView.builder(
                        itemCount: valueList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RadioListTile<int>(
                                    activeColor: ColorRes.blue,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    title: AppText(
                                        appText: valueList[index],
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              value == integerValueList[index]
                                                  ? ColorRes.blue
                                                  : ColorRes.black,
                                        )),
                                    value: integerValueList[index],
                                    groupValue: value,
                                    onChanged: (selectedValue) {
                                      setState(() {
                                        value = selectedValue!;
                                        print(
                                            'radio button value present $value');
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            Container(
              color: ColorRes.whiteF5F5F5,
              child: SizedBox(
                height: MyAppSize.size65,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          CurrentIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 56,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: CurrentIndex == index
                                    ? ColorRes.blue
                                    : ColorRes.greyA0A4AB),
                            borderRadius: BorderRadius.circular(10),
                            color: CurrentIndex == index
                                ? ColorRes.blue
                                : ColorRes.white),
                        child: Center(
                            child: AppText(
                                appText: approveData[index],
                                style: AppTextStyle(
                                    color: CurrentIndex == index
                                        ? ColorRes.white
                                        : ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                    );
                  },
                ),
              ),
            ),
            Space.height(30)
          ],
        ),
      ),
    );
  }
}
