import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/checkout.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/utils/common_container.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({super.key});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int selectedIndex = 0;
  int CurrentIndex = 0;
  List data = ["Save For Later", "Add to Basket"];

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
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
                          const Spacer(),
                          const Icon(
                            Icons.search,
                            size: 28,
                            color: ColorRes.white,
                          ),
                          Space.width(15),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>CheckOutScreen() ));
                            },
                            child: const Icon(
                              Icons.share,
                              size: 28,
                              color: ColorRes.white,
                            ),
                          ),
                          Space.width(15),
                          SvgPicture.asset(ImageRes.basket)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Space.height(20),
              CommomContainer(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorRes.blue),
                    borderRadius: BorderRadius.circular(10),
                    color: ColorRes.whiteE8F1FF),
                child: AppText(
                    appText: 'Visit the Organic Store',
                    style: AppTextStyle(
                        color: ColorRes.black, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                        appText: 'Onion - Medium/Vengayam',
                        style: AppTextStyle(
                            color: ColorRes.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Expanded(child: SvgPicture.asset(ImageRes.greenicon))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Space.width(20),
                  const Icon(
                    Icons.currency_rupee_outlined,
                    size: 15,
                  ),
                  AppText(
                      appText: '28',
                      textAlign: TextAlign.center,
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Space.width(5),
                  const Icon(
                    Icons.currency_rupee_outlined,
                    size: 15,
                  ),
                  AppText(
                      appText: '38',
                      textAlign: TextAlign.center,
                      style: AppTextStyle(
                          color: ColorRes.greyA0A4AB,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Space.height(20),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  height: 26,
                  width: 60,
                  decoration: const BoxDecoration(
                      // border: Border.all(),
                      // ignore: prefer_const_constructors
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: ColorRes.blue),
                  child: Center(
                    child: AppText(
                        appText: '30% Off',
                        textAlign: TextAlign.center,
                        style: AppTextStyle(
                            color: ColorRes.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Space.height(20),
              SizedBox(
                height: 265,
                // decoration: BoxDecoration(border: Border.all(),),
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SvgPicture.asset(ImageRes.container),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
                child: AppText(
                    appText: 'Pack Sizes',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: MyAppSize.size410,
                child: ListView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText(
                                    appText: '500g',
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: ColorRes.black)),
                                Space.width(30),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee_outlined,
                                          size: 15,
                                        ),
                                        AppText(
                                            appText: '32.50',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee_outlined,
                                          size: 15,
                                          color: ColorRes.greyB2B2B2,
                                        ),
                                        AppText(
                                            appText: '41.70',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle(
                                                color: ColorRes.greyB2B2B2,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                selectedIndex == index
                                    ? SvgPicture.asset(
                                        ImageRes.selectradio,
                                        height: 20,
                                      )
                                    : SvgPicture.asset(
                                        ImageRes.unselectradio,
                                        height: 20,
                                      ),
                                Space.width(20),
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
                child: AppText(
                    appText: 'About This Products',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: MyAppSize.size300,
                child: ListView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  appText: 'About the Products',
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: ColorRes.black)),
                              const Spacer(),
                              const Icon(Icons.add),
                              // SvgPicture.asset(
                              //   ImageRes.down_arrow,
                              //   height: 10,
                              // ),
                              Space.width(20),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
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
                            CurrentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 58,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index == 0
                                  ? Icon(
                                      Icons.save_alt,
                                      size: 15,
                                    )
                                  : SvgPicture.asset(
                                      ImageRes.basket,
                                      height: 18,
                                    ),
                              Space.width(3),
                              Center(
                                  child: AppText(
                                      appText: data[index],
                                      style: AppTextStyle(
                                          color: CurrentIndex == index
                                              ? ColorRes.white
                                              : ColorRes.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AppText(
                    appText: 'Ratings & Reviews',
                    textAlign: TextAlign.start,
                    style: AppTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: ColorRes.black)),
              ),
              Space.height(30),
              Padding(
                padding: const EdgeInsets.only(left: 78.0),
                child: Container(
                  height: 150,
                  // decoration: BoxDecoration(border: Border.all()),
                  child: SvgPicture.asset(
                    ImageRes.rating,
                    height: 200,
                    width: 250,
                  ),
                ),
              ),
              Space.height(30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AppText(
                    appText: 'You May like to View more in',
                    textAlign: TextAlign.start,
                    style: AppTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: ColorRes.black)),
              ),
              SizedBox(
                height: 70,
                // decoration: BoxDecoration(border: Border.all()),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 130,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: ColorRes.whiteE8F1FF),
                      child: Center(
                        child: AppText(
                            textAlign: TextAlign.center,
                            appText: 'Fruits',
                            style: AppTextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Row(
                  children: [
                    AppText(
                        appText: 'Similar Products',
                        textAlign: TextAlign.start,
                        style: AppTextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: ColorRes.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward,),

                  ],
                ),
              ),


              Space.height(20),
              Container(
                height: MyAppSize.size330,
                width: MyAppSize.safeWidth,
                // decoration: BoxDecoration(border: Border.all()),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 246,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        // border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          color: ColorRes.whiteE8F1FF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 135,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(15),
                                  height: 104,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorRes.greyC4C4C4),
                                ),
                                Positioned(
                                    left: 128,
                                    top: 22,
                                    child: SvgPicture.asset(ImageRes.greenicon)),
                                Positioned(
                                  top: 35,
                                  child: Container(
                                    height: 26,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(),
                                      // ignore: prefer_const_constructors
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        color: ColorRes.blue),
                                    child: Center(
                                      child: AppText(
                                          appText: '30% Off',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle(
                                              color: ColorRes.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Space.width(20),
                              AppText(
                                  appText: 'ONION',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle(
                                      color: ColorRes.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Space.width(5),
                              AppText(
                                  appText: '(Medium)',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle(
                                      color: ColorRes.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Space.width(20),
                              const Icon(
                                Icons.currency_rupee_outlined,
                                size: 15,
                              ),
                              AppText(
                                  appText: '28',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle(
                                      color: ColorRes.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Space.width(5),
                              const Icon(
                                Icons.currency_rupee_outlined,
                                size: 15,
                              ),
                              AppText(
                                  appText: '38',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle(
                                      color: ColorRes.grey696969,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Space.height(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Space.width(15),
                              Container(
                                height: 32,
                                width: 60,
                                decoration: BoxDecoration(
                                  // border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorRes.greyE6E6E6),
                                child: Center(
                                  child: AppText(
                                      appText: '1 kg',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(
                                          color: ColorRes.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Space.width(8),
                              Container(
                                height: 32,
                                width: 60,
                                decoration: BoxDecoration(
                                  // border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorRes.blue),
                                child: Center(
                                  child: AppText(
                                      appText: 'ADD',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(
                                          color: ColorRes.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Space.width(20),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ]),
      ),
    );
  }
}
