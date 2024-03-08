import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/screen/loginscreen.dart';
import '../constants/app_size_constants.dart';
import '../constants/colorres.dart';
import '../constants/imageres.dart';
import '../main.dart';
import '../utils/app_text.dart';
import '../utils/app_text_field.dart';
import '../utils/common_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _verificationId = '';

  bool value = false;
  List data = [
    "assets/images/google.svg",
    "assets/images/facebook.svg",
    "assets/images/apple.svg"
  ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<void> _signup() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: pwdController.text,
      );

      // Use the user's UID as the document ID when adding user data to Firestore
      await _firestore
          .collection('ragisterUsers')
          .doc(userCredential.user!.uid)
          .set({
        'fname': fnameController.text,
        'email': emailController.text,
        'phone': phnController.text,
        'address': address.text
        // Add other user data fields as needed
      });
      await sharedPreferences.setString("uid", "${userCredential.user!.uid}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: AppText(
            appText: "SignUp Successful",
            style: AppTextStyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ));
      print('SignUp Successful: ${userCredential.user!.uid}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: AppText(
            appText: "The email address is already in use by another account.",
            style: AppTextStyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ));
      print('SignUp Failed: $e');
    }
  }

  // bool _codeSent = false;
  //
  // Future<void> _signInWithPhone(String phoneNumber) async {
  //   String phoneWithCountryCode = '+91 $phoneNumber'; // Change the country code accordingly
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneWithCountryCode,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       UserCredential userCredential = await _auth.signInWithCredential(credential);
  //       // Handle sign-in success
  //       print('User signed in: ${userCredential.user}');
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       // Handle verification failed
  //       print('Verification failed: $e');
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       // Navigate to a screen to enter OTP
  //       setState(() {
  //         _verificationId = verificationId;
  //         _codeSent = true;
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Handle timeout
  //       _verificationId = verificationId;
  //     },
  //   );
  // }
  //
  // void _verifyOTP(String smsCode) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: _verificationId, smsCode: smsCode);
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     // Handle sign-in success
  //     print('Sign-in successful: ${userCredential.user!.uid}');
  //   } catch (e) {
  //     // Handle verification failed
  //     print('Verification failed: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.height(100),
              Center(child: Image.asset(ImageRes.logo,height: 100,)),
              Space.height(20),
              Center(
                child: AppText(
                    appText: "Create Your Grocery Store",
                    style: AppTextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ),
              Space.height(30),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: AppText(
                  appText: 'Full Name*',
                  style: AppTextStyle(
                      color: ColorRes.splash472D2D,

                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SizedBox(
                    height: 58,
                    child: AppTextField(
                      hintText: "Alberto D. Johnson",
                      needValidation: true,
                      validationMessage: "name",
                      controller: fnameController,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: AppText(
                  appText: 'Email*',
                  style: AppTextStyle(
                      color: ColorRes.splash472D2D,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SizedBox(
                    height: 58,
                    child: AppTextField(
                      hintText: "abc@gmail.com",
                      needValidation: true,
                      validationMessage: "email",
                      controller: emailController,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: AppText(
                    appText: 'Phone No*',
                    style: AppTextStyle(
                        color: ColorRes.splash472D2D,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: SizedBox(
                    height: 58,
                    child: AppTextField(
                      textInputType: TextInputType.numberWithOptions(),
                      controller: phnController,
                      needValidation: true,
                      isPhoneValidation: true,
                      validationMessage: "Please enter a valid Phone number",
                      hintText: " +1 678-336-7172",
                    )),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: AppText(
                    appText: 'Password*',
                    style: AppTextStyle(
                        color: ColorRes.splash472D2D,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: SizedBox(
                  height: 58,
                  child: AppTextField(
                    needValidation: true,
                    isPassWordValidation: true,
                    validationMessage: "Please enter Correct password",
                    controller: pwdController,
                    hintText: "**********",
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: ColorRes.splash472D2D,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: AppText(
                    appText: 'Address',
                    style: AppTextStyle(
                        color: ColorRes.splash472D2D,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                child: SizedBox(
                  height: 58,
                  child: AppTextField(
                    needValidation: true,
                    isPassWordValidation: true,
                    controller: address,
                    hintText: "Address",
                  ),
                ),
              ),
              Space.height(32),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: appBorderButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _signup();
                    }
                  },
                  btnText: 'REGISTER NOW',
                ),
              ),
              Space.height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: 120,
                      child: Divider(
                        color: ColorRes.black,
                        thickness: 2,
                      )),
                  Space.width(20),
                  AppText(
                      appText: "or",
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                  Space.width(20),
                  const SizedBox(
                      width: 120,
                      child: Divider(
                        color: ColorRes.black,
                        thickness: 2,
                      )),
                ],
              ),
              Space.height(24),

              Padding(
                padding: const EdgeInsets.only(left: 58),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyle(
                              color: ColorRes.splash472D2D,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Login Now",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          style: AppTextStyle(
                              color: ColorRes.orangeF16522,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ])),
              ),
              Space.height(14),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0),
              //   child: SizedBox(
              //     height: 85,
              //     child: ListView.builder(
              //       itemCount: 3,
              //       scrollDirection: Axis.horizontal,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemBuilder: (context, index) {
              //         return CommomContainer(
              //             height: 60,
              //             width: 74,
              //             child: SvgPicture.asset(
              //               data[index],
              //               height: 10,
              //               width: 10,
              //             ));
              //       },
              //     ),
              //   ),
              // ),
              // Image.asset('assets/images/loginbg.png',
              //     height: 150, width: double.infinity), // Image.
              // // Image.asset("assets/images/loginbg")
            ],
          ),
        ),
      ),
    );
  }
}

// await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: "+91${phnController.text}",verificationCompleted: (phoneAuthCredential) {
//
// }, verificationFailed: (error) {
//
// }, codeSent: (verificationId, forceResendingToken) {
//
// }, codeAutoRetrievalTimeout: (verificationId) {
//
// },);
// await FirebaseAuth.instance.verifyPhoneNumber(
//   phoneNumber: '+91${phnController.text}',
//   verificationCompleted: (PhoneAuthCredential credential) async{
//     // await FirebaseAuth.instance.signInWithCredential(credential);
//   },
//   verificationFailed: (FirebaseAuthException e) {
//     if(e.code == "invaild-phone-number")
//       {
//         Get.snackbar('ERROR', "nuMBER nOT OK");
//       }else
//         {
//           Get.snackbar('ERROR', "ty agei");
//         }
//   },
//   codeSent: (String verificationId, int? resendToken) {},
//   codeAutoRetrievalTimeout: (verificationId) {
//     // this.verificationId.value = verificationId;
//   },
// );
