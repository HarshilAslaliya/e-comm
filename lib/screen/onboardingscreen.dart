import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/screen/loginscreen.dart';
import 'package:electronics_app/utils/app_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Map<String, dynamic>> pages = [
    {
      'image': ImageRes.onb1,
      'title': 'Browse all the Category',
      'subtitle':
          'Eat Fresh Fruits and Vegetables and Try to be Healthy Ergo illi intellegunt quid.',
    },
    {
      'image': ImageRes.onb2,
      'title': 'Amazing Discount & Offers',
      'subtitle':
          'Healthly Maeks store where we deliver Everything on Time Aristo putamus aetatem.',
    },
    {
      'image': ImageRes.onb3,
      'title': 'Delivery in 30 Min',
      'subtitle':
          'Eat Fresh Fruits and Vegetables and Try to be Healthy Ergo illi intellegunt quid.',
    },
  ];
  final PageController pageController = PageController();
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.height(50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  activePage == 2
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        )
                ],
              ),
            ),
            // Container(height: 300,decoration: BoxDecoration(border: Border.all()),),
            Space.height(350),
            SizedBox(
              // decoration: BoxDecoration(border: Border.all()),
              height: MyAppSize.size448,

              // decoration: BoxDecoration(border: Border.all()),
              child: PageView.builder(
                allowImplicitScrolling: true,
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    activePage = index;
                  });
                },
                itemBuilder: (context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                          appText: pages[index]['title'],
                          style: AppTextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      Space.height(10),
                      AppText(
                          appText: pages[index]['subtitle'],
                          style: AppTextStyle(
                              color: ColorRes.greyA0A4AB,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                      Space.height(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 0; i < pages.length; i++)
                            i == activePage
                                ? Container(
                                    // margin:
                                    //     const EdgeInsets.symmetric(horizontal: 3.0),
                                    height: 8.0,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorRes.blue,
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    height: 8.0,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorRes.greyA0A4AB),
                                      shape: BoxShape.circle,
                                      color: ColorRes.white,
                                    ),
                                  ),
                        ],
                      ),
                      Space.height(50),
                      GestureDetector(
                        onTap: () {
                          if (activePage < 2) {
                            pageController.animateToPage(
                              activePage + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                          activePage == 2
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                )
                              : Container();
                        },
                        child: SvgPicture.asset(
                          pages[index]['image'],
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      // Container(height: 10,width: 300,decoration: BoxDecoration(border: Border.all()),)
                      // SvgPicture.asset(ImageRes.onb4),
                    ],
                  );
                },
              ),
            )
          ]),
    ));
  }
}
