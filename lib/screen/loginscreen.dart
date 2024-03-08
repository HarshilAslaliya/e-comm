import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/main.dart';
import 'package:electronics_app/screen/enter_mobile.dart';
import 'package:electronics_app/screen/homescreen.dart';
import 'package:electronics_app/screen/ragistration.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import '../constants/app_size_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List data = [
    "assets/images/google.svg",
    "assets/images/facebook.svg",
    "assets/images/apple.svg"
  ];
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: pwdController.text,
      );
      // Login successful, you can navigate to another screen or display a success message
      print('Login Successful: ${userCredential.user!.uid}');
      await sharedPreferences.setString("uid", userCredential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: AppText(
            appText: "Login Successful",
            style: AppTextStyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: AppText(
            appText: "User not found please go to ragister",
            style: AppTextStyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ));
      // Login failed, display error message to the user
      print('Login Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorRes.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.height(130),
              Center(
                child: Image.asset(ImageRes.logo,height: 100,),
              ),
              Space.height(20),
              AppText(
                  appText: "Welcome to Our Grocery Store",
                  style: AppTextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Space.height(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                    child: AppText(
                      appText: 'Email',
                      style: AppTextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Space.height(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: SizedBox(
                        height: 58,
                        child: AppTextField(
                          hintText: "abc@gmail.com",
                          needValidation: true,
                          isEmailValidation: true,
                          validationMessage: "Please enter valid email address",
                          controller: emailController,
                        )),
                  ),
                ],
              ),
              Space.height(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 5),
                    child: AppText(
                        appText: 'Password*',
                        style: AppTextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  Space.height(5),
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
                            ))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: AppText(
                        appText: "Forgot Password?",
                        style: AppTextStyle(
                            color: ColorRes.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ),
                ],
              ),
              Space.height(42),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: appBorderButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  btnText: 'LOGIN',
                ),
              ),
              Space.height(20),
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
              Space.height(20),
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
              Space.height(30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don’t have an account? ",
                          style: AppTextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Register Now",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                          style: AppTextStyle(
                              color: ColorRes.orangeF16522,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ])),
              ),
              Space.height(17),
              // Expanded(
              //   child: Image.asset('assets/images/loginbg.png',
              //       height: 150, width: double.infinity),
              // ), // Image.
              // Image.asset("assets/images/loginbg")
            ],
          ),
        ),
      ),
    );
  }
}
