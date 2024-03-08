import 'package:electronics_app/screen/checkout.dart';
import 'package:electronics_app/screen/favorite_screen.dart';
import 'package:electronics_app/screen/privacypolicy.dart';
import 'package:electronics_app/screen/serch_list.dart';
import 'package:electronics_app/screen/termsandcondition.dart';
import 'package:electronics_app/services/fov_conteroller.dart';
import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/fruitsandvegitables.dart';
import 'package:electronics_app/screen/profilescreen.dart';
import 'package:electronics_app/screen/shopbycatagory.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:electronics_app/utils/app_text_field.dart';
import 'package:electronics_app/utils/common_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'offerspage.dart';
import 'order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  int selectedIndex = 0;
  String _selectedUnit =
      '1 kg'; // Declare and initialize _selectedUnit variable

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  List<String> drawerData = [
    "Home",
    "Offers",
    "Order",
    "Terms & Conditions",
    "Privacy Policy",
    "FAQs",
  ];

  List k = [];

  Future<List<Map<String, dynamic>>> fetchSubcategoriesAndImages(
      String category) async {
    List<Map<String, dynamic>> subcategories = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .get();

      querySnapshot.docs.forEach((doc) {
        List<dynamic> subcategoryList = doc['subcategory'];
        List<dynamic> imageUrlList = doc['imageUrls'];

        for (int i = 0; i < subcategoryList.length; i++) {
          subcategories.add({
            'subcategory': subcategoryList[i],
            'imageUrl': imageUrlList[i],
          });
        }
      });
    } catch (e) {
      print('Error fetching subcategories: $e');
    }

    return subcategories;
  }

  FovController fovController = Get.put(FovController());

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView.builder(
            itemCount: drawerData.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  // height: 200,
                  color: ColorRes.blue,
                  child: SizedBox(
                    height: 240,
                    child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: ColorRes.blue,
                        ),
                        child: Column(children: [
                          Container(
                            height: 90,
                            width: 310,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorRes.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: AppText(
                                  appText: 'Hello, Jeffrey A. Gibson',
                                  style: AppTextStyle(
                                      fontSize: 18,
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          Space.height(20),
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorRes.whiteE8F1FF,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 25,
                                      color: ColorRes.blue,
                                    ),
                                  ),
                                  Space.width(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          appText: 'DELIVERING TO HOME',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      AppText(
                                          appText: '21, Rajainager, Bangaluru',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle(
                                              color: ColorRes.purple2B0752,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
                  ),
                );
              }
              final item = drawerData[index - 1];
              IconData? iconData;

              switch (item) {
                case 'My Account':
                  iconData = Icons.add;
                  break;
                case 'Shop By Category':
                  iconData = Icons.arrow_forward_ios_rounded;
                  break;
                // case 'FAQs':
                //   iconData = (Icons.add);
                //   break;
                default:
                  iconData = null;
              }

              return ListTile(
                trailing: iconData != null ? Icon(iconData) : null,
                title: AppText(
                  textAlign: TextAlign.start,
                  appText: item,
                  style: AppTextStyle(
                      fontSize: 16,
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  switch (index) {
                    case 0:
                      // Home screen
                      Scaffold.of(context).closeDrawer();
                      break;
                    case 1:
                      // My Account screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountScreen()));
                      break;
                    case 2:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OffersScreen()));
                      break;
                    case 3:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()));
                      break;
                    case 4:
                      // My Account screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsAndCondition()));
                      break;
                    case 5:
                      // My Account screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrivacyPolicy()));
                      break;
                  }
                },
              );
            },
          ),
        ),
        backgroundColor: ColorRes.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 480,
                child: Stack(
                  children: [
                    Container(
                      height: MyAppSize.size330,
                      width: MyAppSize.safeWidth,
                      decoration: const BoxDecoration(color: ColorRes.blue),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Space.height(40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: GestureDetector(
                                    onTap: () {
                                      _scaffoldKey.currentState?.openDrawer();
                                    },
                                    child: const Icon(
                                      Icons.menu,
                                      size: 28,
                                      color: ColorRes.white,
                                    ),
                                  ),
                                ),
                                Space.width(10),
                                const Text(
                                  "Electronic",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    await Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => FavoriteScreen(),
                                    ));

                                    fovController.fetchCartItems();
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 28,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Space.width(15),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckOutScreen(),
                                        ));
                                  },
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    size: 28,
                                    color: ColorRes.white,
                                  ),
                                ),
                                Space.width(15),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileScreen()));
                                  },
                                  child: const Icon(
                                    Icons.person_outline_outlined,
                                    size: 28,
                                    color: ColorRes.white,
                                  ),
                                ),
                              ],
                            ),
                            Space.height(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 28,
                                  color: ColorRes.white,
                                ),
                                Space.width(10),
                                AppText(
                                    appText: 'Wayback Lane Yaphank, NY',
                                    style: AppTextStyle(
                                        fontSize: 15,
                                        color: ColorRes.white,
                                        fontWeight: FontWeight.w500)),
                                Space.width(10),
                                Expanded(
                                    child: AppText(
                                        appText: 'INSTANT 35 Mins',
                                        style: AppTextStyle(
                                            fontSize: 15,
                                            color: ColorRes.white,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                            Space.height(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height: 58,
                                      child: AppTextField(
                                        onSubmited: (p0) {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return SerchList(
                                                data: k,
                                                qure: p0,
                                              );
                                            },
                                          ));
                                        },
                                        hintText: 'Search your Groceries',
                                        fillColor: true,
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          size: 21,
                                          color: ColorRes.black,
                                        ),
                                      )),
                                ),
                                Space.width(10),
                                Container(
                                  height: 50,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorRes.whiteE8F1FF),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SvgPicture.asset(
                                      ImageRes.homemenu,
                                      height: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 230,
                      // Positioning the yellow container 250 pixels from the top
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.all(8),
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorRes.yellowFBA308),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              ImageRes.healthy,
                            ),
                            Space.height(20),
                            Padding(
                              padding: const EdgeInsets.only(right: 88.0),
                              child: Container(
                                height: MyAppSize.size36,
                                width: MyAppSize.size100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorRes.splash472D2D),
                                child: Center(
                                  child: AppText(
                                      appText: 'shop now',
                                      style: AppTextStyle(
                                          color: ColorRes.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CommomContainer(
                height: MyAppSize.size58,
                width: MyAppSize.safeWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorRes.splash472D2D),
                child: Center(
                  child: AppText(
                      appText: 'FREE DELIVERY ON YOUR GROCERYUS ORDERS',
                      textAlign: TextAlign.center,
                      style: AppTextStyle(
                          color: ColorRes.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: AppText(
                    appText: 'Coupons for You',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(
                        color: ColorRes.purple2B0752,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Space.height(10),
              SizedBox(
                height: 100,
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (int index) {
                    selectedPage = index;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MyAppSize.safeWidth,
                      height: 100,
                      child: Container(
                          child: SvgPicture.asset(
                        ImageRes.coupen,
                        height: 100,
                      )),
                    );
                  },
                ),
              ),
              Space.height(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          //  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          height: 10.0,
                          width: 10,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: i == selectedPage
                                  ? ColorRes.blue
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: i == selectedPage ? ColorRes.blue : null,
                          ),
                        )),
                ],
              ),
              Space.height(10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ShopByCategoryScreen()));
                  },
                  child: AppText(
                      appText: 'Shop By Category',
                      textAlign: TextAlign.center,
                      style: AppTextStyle(
                          color: ColorRes.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Space.height(10),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    // scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 151,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      var document = snapshot.data?.docs[index];
                      var category = document?['category'];
                      k.add(category);
                      var categoryImage = document?.get(
                          'singleImageUrl'); // Access categoryImage using get() method

                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 151,
                          width: 300,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FruitsAndVegeitablesScreen(
                                        category:
                                            category ?? 'Unknown Category',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorRes.whiteE8F1FF,
                                    image: categoryImage != null
                                        ? DecorationImage(
                                            image: NetworkImage(categoryImage),
                                            fit: BoxFit.cover,
                                          )
                                        : null, // Set image to null if categoryImage is null
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  category ?? 'No category',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: ColorRes.purple2B0752,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Space.height(10),
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance
              //       .collection('products')
              //       .snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     }
              //
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //
              //       return Center(child: const CircularProgressIndicator());
              //     }
              //     var document = snapshot.data?.docs;
              //     print(document![0]['description']);
              //     return Column(
              //       children: [
              //         GridView.builder(
              //           shrinkWrap: true,
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             mainAxisExtent: 151,
              //             mainAxisSpacing: 10,
              //           ),
              //           itemCount: document[0]['description'].length,
              //           itemBuilder: (context, index) {
              //           return Container();
              //         },),
              //         GridView.builder(
              //           shrinkWrap: true,
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             mainAxisExtent: 151,
              //             mainAxisSpacing: 10,
              //           ), itemBuilder: (context, index) {
              //           return Container();
              //         },),
              //       ],
              //     );
              //   },
              // ),

              // CommomContainer(
              //     height: 185,
              //     width: MyAppSize.safeWidth,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: ColorRes.whiteE8F1FF),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 18.0),
              //           child: Container(
              //             height: 140,
              //             width: 140,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: ColorRes.white),
              //           ),
              //         ),
              //         Space.width(10),
              //         Expanded(child: SvgPicture.asset(ImageRes.banner))
              //       ],
              //     )),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              //   child: Row(
              //     children: [
              //       AppText(
              //           appText: 'SUBCATEGORY',
              //           textAlign: TextAlign.center,
              //           style: AppTextStyle(
              //               color: ColorRes.black,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold)),
              //       const Spacer(),
              //       GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         const ShopByCategoryScreen()));
              //           },
              //           child: const Icon(Icons.arrow_forward_ios_rounded))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: MyAppSize.safeHeight,
              //   width: MyAppSize.safeWidth,
              //   child: StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('products')
              //         .snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.hasError) {
              //         return Text('Error: ${snapshot.error}');
              //       }
              //
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const CircularProgressIndicator();
              //       }
              //
              //       return GridView.builder(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         scrollDirection: Axis.vertical,
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemCount: snapshot.data?.docs.length ?? 0,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           mainAxisExtent: 246,
              //           mainAxisSpacing: 10,
              //           crossAxisSpacing: 10,
              //         ),
              //         itemBuilder: (context, index) {
              //           var document = snapshot.data?.docs[index];
              //           var imageUrls =
              //               List<String>.from(document?['imageUrls'] ?? []);
              //           var subcategories =
              //               List<String>.from(document?['subcategory'] ?? []);
              //           var price = document?['price'];
              //           var discountPrice = document?['discountPrice'];
              //           var singleImageUrl = document?['singleImageUrl'];
              //
              //           return Container(
              //             margin: const EdgeInsets.all(5),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: ColorRes.whiteE8F1FF,
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   margin: const EdgeInsets.all(15),
              //                   height: 104,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(20),
              //                     color: ColorRes.greyC4C4C4,
              //                     image: DecorationImage(
              //                       image: NetworkImage(singleImageUrl ?? ''),
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Space.width(20),
              //                     AppText(
              //                       appText: subcategories.isNotEmpty
              //                           ? subcategories[0]
              //                           : '',
              //                       textAlign: TextAlign.center,
              //                       style: AppTextStyle(
              //                         color: ColorRes.black,
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Space.width(20),
              //                     const Icon(
              //                       Icons.attach_money,
              //                       size: 15,
              //                     ),
              //                     AppText(
              //                       appText: price.isNotEmpty ? price[0] : '',
              //                       textAlign: TextAlign.center,
              //                       style: AppTextStyle(
              //                         color: ColorRes.black,
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                     Space.width(5),
              //                     const Icon(
              //                       Icons.attach_money,
              //                       size: 15,
              //                     ),
              //                     AppText(
              //                       appText: discountPrice.isNotEmpty
              //                           ? discountPrice[0]
              //                           : '',
              //                       textAlign: TextAlign.center,
              //                       style: AppTextStyle(
              //                         color: ColorRes.grey696969,
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 Space.height(10),
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8.0),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       // Declare and initialize _selectedUnit variable
              //
              //                       // Space.width(8),
              //                       Container(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 10, vertical: 5),
              //                         margin: const EdgeInsets.symmetric(
              //                             horizontal: 10, vertical: 5),
              //                         decoration: BoxDecoration(
              //                             // border: Border.all(),
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                             color: ColorRes.blue),
              //                         child: Center(
              //                           child: AppText(
              //                               appText: 'ADD TO CART',
              //                               textAlign: TextAlign.center,
              //                               style: AppTextStyle(
              //                                   color: ColorRes.white,
              //                                   fontSize: 14,
              //                                   fontWeight: FontWeight.bold)),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}
