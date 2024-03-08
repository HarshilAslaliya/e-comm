import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronics_app/screen/detailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/screen/freshvegetables.dart';
import 'package:electronics_app/services/fov_conteroller.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter_svg/svg.dart';

import '../cartmodel.dart';
import '../utils/fetchsubcatagoryfromproduct.dart';

import 'package:get/get.dart';

class FruitsAndVegeitablesScreen extends StatefulWidget {
  final String? category;

  FruitsAndVegeitablesScreen({
    super.key,
    this.category,
  });

  @override
  State<FruitsAndVegeitablesScreen> createState() =>
      _FruitsAndVegeitablesScreenState();
}

class _FruitsAndVegeitablesScreenState
    extends State<FruitsAndVegeitablesScreen> {
  int selectedPage = 0;
  String _selectedUnit = '1 kg';
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  FovController fovController = Get.put(FovController());
  String? data ;

  var selectedProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
      //
  }

  getdata()async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: widget.category)
        .get();

    data = querySnapshot.docs[0]['singleImageUrl'];
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 270,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(color: ColorRes.blue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        children: [
                          Space.height(30),
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
                                Space.width(50),
                                AppText(
                                    appText: widget.category ?? "no data",
                                    style: AppTextStyle(
                                        fontSize: 18,
                                        color: ColorRes.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MyAppSize.size410,
                          height: MyAppSize.size200,
                          child: SvgPicture.asset(ImageRes.fruits),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Space.height(20),




            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  AppText(
                      appText: 'View All',
                      style: AppTextStyle(
                          fontSize: 20,
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FreshVegetableScreen(
                              catagory: widget.category,
                            ),
                          ));
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: ColorRes.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Space.height(20),
             FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchSubcategoriesAndImages(
                    widget.category ?? "No Category"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No subcategories found.');
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount:
                          snapshot.data!.length > 3 ? 3 : snapshot.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var subcategory =
                            snapshot.data![index]['subcategory'] as String;
                        var imageUrl =
                            snapshot.data![index]['imageUrl'] as String;
                        var price = snapshot.data![index]['price'];
                        var discountPrice =
                            snapshot.data![index]['discountPrice'];

                        Map<String, dynamic> allProductData =
                            snapshot.data![index];

                        // Debug prints
                        print('Price: $price');
                        print('Discount Price: $discountPrice');

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  image: allProductData["imageUrl"],
                                  name: allProductData["subcategory"],
                                  price: allProductData["price"],
                                  allProductData: allProductData,
                                  description: allProductData["description"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorRes.whiteE8F1FF,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Product Image
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 135,
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(15),
                                            height: 144,
                                            width: MediaQuery.of(context).size.width * 0.3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: ColorRes.greyC4C4C4,
                                            ),
                                            child: Image.network(
                                              imageUrl,
                                              fit: BoxFit.fill,
                                            ), // Display image
                                          ),
                                          // if (discountPrice != null &&
                                          //     price != null &&
                                          //     discountPrice < price)
                                          Positioned(
                                            top: 35,
                                            child: Container(
                                              height: 26,
                                              width: 60,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                color: ColorRes.blue,
                                              ),
                                              child: Center(
                                                child: AppText(
                                                  appText: '30% Off',
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle(
                                                    color: ColorRes.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Product Details
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Space.height(10),
                                  
                                      // Product Name and Size
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.start,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                          Space.width(20),
                                          AppText(
                                            appText: subcategory,
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // Space.width(5),
                                          // Space.width(15),
                                          // Space.width(30),
                                          //
                                      // Product Prices
                                      Space.height(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.currency_rupee_outlined,
                                            size: 15,
                                          ),
                                          AppText(
                                            appText: price.toString(),
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Space.width(5),
                                          const Icon(
                                            Icons.currency_rupee_outlined,
                                            size: 15,
                                          ),
                                          AppText(
                                            appText: discountPrice.toString(),
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle(
                                              color: ColorRes.grey696969,
                                              textDecoration: TextDecoration.lineThrough,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                  
                                            ),
                                          ),
                                        ],
                                      ),
                                      Space.height(20),
                                      // Add Button
                                      GestureDetector(
                                        onTap: () {
                                          CartItem.addToCart(allProductData);
                                  
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Item added to cart.'),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorRes.blue,
                                          ),
                                          child: Center(
                                            child: AppText(
                                              appText: 'Add',
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Space.height(10),
                                    ],
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    selectedProduct = allProductData;
                                    allProductData['favorit'] = true;

                                    if (fovController.cartItems1.any((e) =>
                                        e['subcategory'] ==
                                        selectedProduct['subcategory'])) {
                                    } else {
                                      CartItem.addToFavorites(selectedProduct);
                                    }
                                    fovController.fetchCartItems();
                                  },
                                  child: Obx(
                                    () => fovController.cartItems1.any((e) =>
                                            e['subcategory'] ==
                                            allProductData['subcategory'])
                                        ? const Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Colors.red,
                                          )
                                        : const Icon(CupertinoIcons.heart),
                                  ),
                                ),
                                Space.width(10),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
