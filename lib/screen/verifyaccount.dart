import 'package:flutter/material.dart';
import 'package:electronics_app/screen/search_location.dart';

import '../constants/app_size_constants.dart';
import '../constants/colorres.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import '../constants/imageres.dart';
import '../utils/app_text.dart';
import '../utils/app_text_field.dart';
import '../utils/common_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyAccountScreen extends StatefulWidget {
 // final  String? verificationId;
  const VerifyAccountScreen( {super.key,});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {




  final pinTheme = PinTheme(
    width: 62,
    height: 58,
    textStyle: const TextStyle(fontSize: 22, color: ColorRes.blue),
    decoration: BoxDecoration(
      border: Border.all(color: ColorRes.whiteE8F1FF),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final auth = FirebaseAuth.instance;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.height(173),
          Center(child: Image.asset(ImageRes.logo, height: 100,)),
          Space.height(30),
          Center(
            child: AppText(
                appText: "Verify Account",
                style: AppTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
          Space.height(20),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
            child: AppText(
              textAlign: TextAlign.start,
              appText:
                  'Verify yor Account by Entering Verification Code we Sent to (+1) 678-336-7172',
              style: AppTextStyle(
                  color: ColorRes.splash472D2D,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          Space.height(18),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Pinput(
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //margin: const EdgeInsets.only(bottom: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.blue,
                    ),
                  ),
                ],
              ),
              defaultPinTheme: pinTheme,
              focusedPinTheme: pinTheme,
            ),
          ),
          Center(
            child: AppText(
              textAlign: TextAlign.center,
              appText: 'Resend  OTP',
              style: AppTextStyle(
                  color: ColorRes.orangeF16522,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ),
          Space.height(10),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: appBorderButton(
              onTap: () {
                showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        content: Center(
                          child: Column(
                            children: [
                              // CircleAvatar(radius: 50,),
                              Space.height(250),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white,
                                ),
                                width: MyAppSize.safeWidth! - 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    //    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Space.height(20),
                                      Center(
                                          child: SvgPicture.asset(
                                        "assets/images/verify.svg",
                                        height: 100,
                                        width: 100,
                                      )),
                                      Center(
                                        child: AppText(
                                            textAlign: TextAlign.start,
                                            appText: 'Verified',
                                            style: AppTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Center(
                                        child: AppText(
                                            textAlign: TextAlign.center,
                                            appText:
                                                'Hello..! You have Successfully.Verify the Account',
                                            style: AppTextStyle(
                                                color: ColorRes.splash472D2D,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Space.height(40),
                                      appBorderButton(
                                          btnText: "BROWSE HOME", onTap: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchLocationScreen()));
                                      }),
                                      Space.height(50),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [],
                      );
                    });
              },
              btnText: 'VERIFY',

            ),
          ),
          Space.height(20),
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: AppText(
              appText: 'Resend New Code in 00:35',
              style: AppTextStyle(
                  color: ColorRes.purple2B0752,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ),
          Spacer(),
          Space.height(115),

          Expanded(
            child: Image.asset('assets/images/loginbg.png',
                height: 150, width: double.infinity),
          ), // Image.
          // Image.asset("assets/images/loginbg")
        ],
      ),
    );
  }
}
