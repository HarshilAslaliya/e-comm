import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
        backgroundColor: ColorRes.white,
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
                          Space.width(80),
                          AppText(
                              appText: 'AddNewCard',
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
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  ImageRes.CARD,
                  width: MyAppSize.safeWidth,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                child: AppText(
                    appText: 'Card Holder Name*',
                    style: AppTextStyle(
                        color: ColorRes.splash472D2D,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AppTextField(hintText: 'David M. Ramirez'),
              ),
              Space.height(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                child: AppText(
                    appText: 'Card Holder Number*',
                    style: AppTextStyle(
                        color: ColorRes.splash472D2D,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AppTextField(hintText: '1234  5678  6567  3468'),
              ),
              Space.height(20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5),
                    child: AppText(
                        appText: 'Exp.Date*',
                        style: AppTextStyle(
                            color: ColorRes.splash472D2D,
                            fontWeight: FontWeight.w500,
                            fontSize: 13)),
                  ),
                  Space.width(90),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5),
                    child: AppText(
                        appText: 'CVV*',
                        style: AppTextStyle(
                            color: ColorRes.splash472D2D,
                            fontWeight: FontWeight.w500,
                            fontSize: 13)),
                  ),
                ],
              ),
              Space.height(2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                        width: 150, child: AppTextField(hintText: '12/28')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        width: 150, child: AppTextField(hintText: '12/28')),
                  ),
                ],
              ),
              Space.height(20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: AppText(
                        appText: 'Remember My Card Details',
                        style: AppTextStyle(
                            color: ColorRes.splash472D2D,
                            fontWeight: FontWeight.w500,
                            fontSize: 13)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: SizedBox(
                      height: 20,
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor: ColorRes.blue,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: appBorderButton(btnText: 'SAVE CARD'),
              ),
              Space.height(10),
              lastContainer(),
              Space.height(30),
            ],
          ),
        ));
  }
}
