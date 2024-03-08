import 'package:electronics_app/screen/homescreen.dart';
import 'package:electronics_app/screen/verifyaccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_size_constants.dart';
import '../constants/colorres.dart';
import '../constants/imageres.dart';
import '../utils/app_text.dart';
import '../utils/app_text_field.dart';
import '../utils/common_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EnterMobieScreen extends StatefulWidget {
  const EnterMobieScreen({super.key});

  @override
  State<EnterMobieScreen> createState() => _EnterMobieScreenState();
}

class _EnterMobieScreenState extends State<EnterMobieScreen> {
  TextEditingController phnController = TextEditingController();

  bool isloading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool codeSent = false;
  late String verificationId;

  // Future<void> verifyPhone() async {
  //   final PhoneVerificationCompleted verified = (AuthCredential authResult) {
  //     auth.signInWithCredential(authResult);
  //   };
  //
  //   final PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException authException) {
  //     print('Error: ${authException.message}');
  //   };
  //
  //   final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
  //     this.verificationId = verId;
  //     setState(() {
  //       this.codeSent = true;
  //     });
  //   };
  //
  //   final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
  //     this.verificationId = verId;
  //   };
  //
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phnController.text,
  //     timeout: const Duration(seconds: 5),
  //     verificationCompleted: verified,
  //     verificationFailed: verificationFailed,
  //     codeSent: smsSent,
  //     codeAutoRetrievalTimeout: autoTimeout,
  //   );
  // }
  Future<void> verifyPhoneNumber(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phnController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Sign in the user with the auto-generated credential upon verification
        await auth.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to the OTP screen when code is sent
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyAccountScreen()),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.height(200),
            Center(child: Image.asset(ImageRes.logo, height: 100,)),
            Space.height(50),
            Center(
              child: AppText(
                  appText: "Enter Your Mobile Number",
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            Space.height(30),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
              child: AppText(
                appText: 'Phone Number*',
                style: AppTextStyle(
                    color: ColorRes.splash472D2D, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
              child: SizedBox(
                height: 58,
                child: AppTextField(
                  textInputType: const TextInputType.numberWithOptions(),
                  controller: phnController,
                  needValidation: true,
                  isPhoneValidation: true,
                  validationMessage: "Please enter a valid Phone number",
                  hintText: " +1 678-336-7172",
                ),
              ),
            ),
            Space.height(42),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: appBorderButton(
                // onTap: () {
                //   auth.verifyPhoneNumber(
                //       phoneNumber: phnController.text,
                //       verificationCompleted:
                //           (PhoneAuthCredential credential) async {
                //         // ANDROID ONLY!
                //
                //         // Sign the user in (or link) with the auto-generated credential
                //         await auth.signInWithCredential(credential);
                //       },
                //       verificationFailed: (FirebaseAuthException e) {
                //         if (e.code == 'invalid-phone-number') {
                //           print('The provided phone number is not valid.');
                //         }
                //
                //         // Handle other errors
                //       },
                //       codeSent:
                //           (String verificationId, int? resendToken) async {
                //         // Update the UI - wait for the user to enter the SMS code
                //         String smsCode = '1234';
                //
                //         // Create a PhoneAuthCredential with the code
                //         PhoneAuthCredential credential =
                //             PhoneAuthProvider.credential(
                //                 verificationId: verificationId,
                //                 smsCode: smsCode);
                //
                //         // Sign the user in (or link) with the credential
                //         await auth.signInWithCredential(credential);
                //       },
                //       timeout: const Duration(seconds: 60),
                //       codeAutoRetrievalTimeout: (String verificationId) {
                //         // Auto-resolution timed out...
                //       });
                // },
                onTap: () {
                  //verifyPhoneNumber(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VerifyAccountScreen(),
                      ));
                },
                btnText: 'GET OTP',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
