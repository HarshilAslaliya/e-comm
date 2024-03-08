import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/submitreviews.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MyAppSize.size410,
            child: Stack(children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(color: ColorRes.blue),
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
                            Space.width(110),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SubmitReviewScreen()));
                              },
                              child: AppText(
                                  appText: 'REVIEWS',
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
                  height: 200,
                  width: MyAppSize.safeWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorRes.whiteE8F1FF),
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.white),
                  child: SizedBox(
                      height: 60,
                      child: Column(
                        children: [
                          Space.height(20),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                // border: Border.all(),
                                borderRadius: BorderRadius.circular(50),
                                color: ColorRes.blue),
                            child: Center(
                              child: AppText(
                                  textAlign: TextAlign.center,
                                  appText: '4.5',
                                  style: AppTextStyle(
                                      fontSize: 28,
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          AppText(
                              appText: '325 Reviews',
                              style: AppTextStyle(
                                  fontSize: 16,
                                  color: ColorRes.purple2B0752,
                                  fontWeight: FontWeight.bold)),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      )),
                ),
              )
            ]),
          ),
          Container(
            height: 185,
            // decoration: BoxDecoration(border: Border.all()),
            width: MyAppSize.safeWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorRes.black),
                      ),
                      Space.width(20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              appText: 'Gregory J. Mather',
                              style: AppTextStyle(
                                  fontSize: 17,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.bold)),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      Space.width(10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: AppText(
                            appText: '24 Oct 2022',
                            style: AppTextStyle(
                                fontSize: 13,
                                color: ColorRes.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Space.height(10),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 5),
                  child: AppText(
                      appText:
                          'Aut haec tibi, Torquate, sunt vituperanda aut patrocinium tatis repudiandum non possit beatam praestare vitam sapientia. ',
                      style: AppTextStyle(
                          fontSize: 14,
                          color: ColorRes.grey696969,
                          fontWeight: FontWeight.w500)),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageRes.heart,height: 15,),
                      Space.width(10),
                      AppText(
                          appText: 'Like',
                          style: AppTextStyle(
                              fontSize: 17,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),
                       Space.width(20),
                       SvgPicture.asset(ImageRes.reply,height: 15,),
                      Space.width(10),
                      AppText(
                          appText: 'Reply',
                          style: AppTextStyle(
                              fontSize: 17,
                              color: ColorRes.black,
                              fontWeight: FontWeight.bold)),




                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
