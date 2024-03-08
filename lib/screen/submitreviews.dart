import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:electronics_app/utils/common_container.dart';

class SubmitReviewScreen extends StatefulWidget {
  const SubmitReviewScreen({super.key});

  @override
  State<SubmitReviewScreen> createState() => _SubmitReviewScreenState();
}

class _SubmitReviewScreenState extends State<SubmitReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MyAppSize.size450,
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
                            Space.width(65),
                            GestureDetector(
                              onTap: () {},
                              child: AppText(
                                  appText: ' SUBMIT REVIEWS',
                                  style: AppTextStyle(
                                      fontSize: 18,
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.bold),),
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
                  height: MyAppSize.size280,
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
                            height: 100,
                            width: 100,
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
                          Space.height(20),
                          AppText(
                              appText: '325 Reviews',
                              style: AppTextStyle(
                                  fontSize: 16,
                                  color: ColorRes.purple2B0752,
                                  fontWeight: FontWeight.bold)),
                          Space.height(10),
                          AppText(
                              appText:
                                  'How would you rate quality of this Products',
                              style: AppTextStyle(
                                  fontSize: 16,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500)),
                          Space.height(10),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: AppText(
                textAlign: TextAlign.start,
                appText: 'Leave a Your Valuable \nComments',
                style: AppTextStyle(
                    fontSize: 18,
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold)),
          ),
          Space.height(10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AppText(
                textAlign: TextAlign.start,
                appText:
                    'Aut haec tibi, Torquate, sunt vituperanda aut patrocinium tatis repudiandum non possit beatam praestare vitam sapientia. ',
                style: AppTextStyle(
                    fontSize: 16,
                    color: ColorRes.greyA0A4AB,
                    fontWeight: FontWeight.w500)),
          ),
          Space.height(150),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: appBorderButton(btnText: 'SUBMIT'),
          )
        ],
      ),
    );
  }
}
