import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../cartmodel.dart';
import '../constants/app_size_constants.dart';
import '../constants/colorres.dart';
import '../services/fov_conteroller.dart';
import '../utils/app_text.dart';
import '../utils/app_text_field.dart';
import '../utils/fetchsubcatagoryfromproduct.dart';
import 'detailScreen.dart';

class SerchList extends StatefulWidget {
  SerchList({super.key,this.qure,this.data});
  String? qure;
  List? data;

  @override
  State<SerchList> createState() => _SerchListState();
}

class _SerchListState extends State<SerchList> {

  List<Map<String,dynamic>> Alldata =[];
  List k =[];
  TextEditingController textEditingController = TextEditingController();

  int selectedPage = 0;
  String _selectedUnit = '1 kg';
  final PageController pageController =
  PageController(initialPage: 0, keepPage: true);

  FovController fovController = Get.put(FovController());

  var selectedProduct;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getData();

  }

  getData()async{
    textEditingController.text = widget.qure!;
    widget.data?.forEach((element) async{
     Alldata = await fetchSubcategoriesAndImages(widget.data?[0]);
     Alldata.addAll( await fetchSubcategoriesAndImages(widget.data?[1]));
     Alldata.addAll(await fetchSubcategoriesAndImages(widget.data?[2]));
     Alldata.addAll( await fetchSubcategoriesAndImages(widget.data?[3]));
     Alldata.addAll( await fetchSubcategoriesAndImages(widget.data?[4]));    });
    setState(() {
      k = Alldata;
    });

    print(Alldata);
  }
  serchData({required String ser})
  {
    print(Alldata);
    List<Map<String,dynamic>> rse =[];
    if(ser == "")
      {
        k =Alldata;
        setState(() {

        });
        return;

      }
    else
      {

         rse = Alldata
              .where((user) =>
              user["subcategory"].toLowerCase().contains(ser.toLowerCase()))
              .toList();
      }

    k = rse;
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: 58,
                  child: AppTextField(
                    controller: textEditingController,
                    hintText: 'Search your Groceries',
                    onChangedValue: (p0) {
                      print(p0);
                      serchData(ser: p0);
                    },
                    fillColor: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 21,
                      color: ColorRes.black,
                    ),
                  )),
              Expanded(
                child:  ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount:
                      k.length > 3 ? 3 : k.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var subcategory =
                        k[index]['subcategory'] as String;
                        var imageUrl =
                        k[index]['imageUrl'] as String;
                        var price = k[index]['price'];
                        var discountPrice =
                        k[index]['discountPrice'];

                        Map<String, dynamic> allProductData =
                       k[index];

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
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
