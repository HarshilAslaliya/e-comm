import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
                        Space.width(130),
                        AppText(
                            appText: 'FAQS',
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
            Space.height(20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: '1. How it will take to delivery?',
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  textAlign: TextAlign.start,
                  appText:
                      'Receive notifications related to your order status, payments and support Aut haec tibi, Torquate, sunt vituperanda aut patrocinium voluptatis repudiandum. Quod si ita se habeat, non possit beatam praestare vitam sapientia.',
                  style: AppTextStyle(
                      color: ColorRes.greyA0A4AB,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: '2. What is Refund System?',
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  textAlign: TextAlign.start,
                  appText:
                      'Receive notifications related to your order status, payments and support Aut haec tibi, Torquate, sunt vituperanda aut patrocinium.',
                  style: AppTextStyle(
                      color: ColorRes.greyA0A4AB,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  textAlign: TextAlign.start,
                  appText:
                      'Voluptatis repudiandum. Quod si ita se habeat, non possit beatam praestare vitam sapientia Aliter enim nosmet ipsos nosse non possumus. O magnam vim ingenii causamque iustam quovis conventu te omnia facere, ne doleas. Ratio enim nostra consentit pugnant Stoici cum Peripateticis. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Non est igitur voluptas bonum.',
                  style: AppTextStyle(
                      color: ColorRes.greyA0A4AB,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  appText: '3.How do i return my items?',
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: AppText(
                  textAlign: TextAlign.start,
                  appText:
                      'Receive notifications related to your order status, payments and support Aut haec tibi, Torquate, sunt vituperanda aut patrocinium voluptatis repudiandum. Quod si ita se habeat, non possit beatam praestare vitam sapientia.',
                  style: AppTextStyle(
                      color: ColorRes.greyA0A4AB,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Space.height(30),
          ],
        ),
      ),
    );
  }
}
