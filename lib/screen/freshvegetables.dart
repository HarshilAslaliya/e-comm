import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/detailScreen.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../cartmodel.dart';
import '../main.dart';
import '../services/fov_conteroller.dart';
import '../utils/fetchsubcatagoryfromproduct.dart';
import 'package:get/get.dart';

import 'checkout.dart';
import 'favorite_screen.dart';

class FreshVegetableScreen extends StatefulWidget {
  final String? catagory;

  const FreshVegetableScreen({
    super.key,
    this.catagory,
  });

  @override
  State<FreshVegetableScreen> createState() => _FreshVegetableScreenState();
}

class _FreshVegetableScreenState extends State<FreshVegetableScreen> {
  String _selectedUnit = "1 kg";



  final bool like = false;

  late Set<String> favoriteProductIds;

  late Stream<QuerySnapshot> _itemStream;
  late Set<String> favoriteItemIds;

  bool love = false;
  FovController fovController = Get.put(FovController());
  List k =[];

  @override
  void initState() {
    super.initState();
    _itemStream =
        FirebaseFirestore.instance.collection('favoriteProduct').snapshots();
    favoriteItemIds = {};
    _fetchFavorites();
    fovController.fetchCartItems();

    ()async{

      k = await fetchRecentlyView();
      setState(() {

      });
    };
  }

  List<Map<String, dynamic>> cartItems = [];

  var selectedProduct;

  @override
  Widget build(BuildContext context) {

    MyAppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 142,
              width: MyAppSize.safeWidth,
              color: ColorRes.blue,
              child: Column(
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
                        Space.width(50),
                        AppText(
                            appText: "${widget.catagory}",
                            style: AppTextStyle(
                                fontSize: 18,
                                color: ColorRes.white,
                                fontWeight: FontWeight.bold)),
                         Spacer(),
                        InkWell(
                          onTap: () async{
                           await  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteScreen(),));

                           fovController.fetchCartItems();

                          },
                          child: const Icon(
                            Icons.favorite,
                            size: 28,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              // decoration: BoxDecoration(border: Border.all()),
              child: FutureBuilder(
                future: fetchSubcategoriesAndImages(
                    widget.catagory ?? "No Category"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No subcategories found.');
                  } else {
                    List<Map<String, dynamic>> subcategoryData = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subcategoryData.length,
                      itemBuilder: (context, index) {
                        var categoryData = subcategoryData[index];
                        var subcategoryRaw = categoryData['subcategory'];
                        var subcategories = subcategoryRaw is List<String>
                            ? subcategoryRaw
                            : [subcategoryRaw];
                        var imageUrl = categoryData['imageUrl'];

                        // Concatenate the subcategories into a single string
                        var displayedSubcategories = subcategories.join(", ");

                        return GestureDetector(
                          onTap: () {
                            // Handle tap on the category
                          },
                          child: Container(
                            width: 130,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorRes.whiteE8F1FF,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  appText: displayedSubcategories.isNotEmpty
                                      ? displayedSubcategories
                                      : 'No Subcategories',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle(
                                    color: ColorRes.purple2B0752,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  AppText(
                      appText: '268 ITEMS',
                      style: AppTextStyle(
                          fontSize: 20,
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckOutScreen(),
                            ));
                      },
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('cartItem')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // While data is loading
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // If there's an error fetching data
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Calculate the total number of items in the cart
                            int itemCount = snapshot.data!.docs.length;

                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(Icons.shopping_cart),
                                Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          itemCount.toString(),
                                          // Display the count here
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Space.height(20),
            SizedBox(
              width: MyAppSize.safeWidth,
              child: FutureBuilder(
                future: fetchSubcategoriesAndImages(
                    widget.catagory ?? "No Category"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No products found.');
                  } else {
                    List<Map<String, dynamic>> productsData = snapshot.data!;

                    return ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount: productsData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> allProductData = productsData[index];
                        print(".........................");
                        print(snapshot.hasData);
                        // print("${productsData[index]['imageUrl']}");
                        print("${(productsData[index]['subcategory'])}");
                        print("${productsData[index]['id']}");
                        return index == 3
                            ? Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(18),
                                height: 200,
                                color: ColorRes.redF44831,
                              )
                            : GestureDetector(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 135,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(15),
                                                  height: 144,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: ColorRes.greyC4C4C4,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        allProductData[
                                                            "imageUrl"],
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),

                                                // if (discountPrice != null && discountPrice < price)
                                                Positioned(
                                                  top: 35,
                                                  child: Container(
                                                    height: 26,
                                                    width: 60,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                      color:
                                                          ColorRes.blue,
                                                    ),
                                                    child: Center(
                                                      child: AppText(
                                                        appText: '30% Off',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyle(
                                                          color: ColorRes.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                      // Rest of the UI elements and data display
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Space.height(30),
                                          // Product Name and Size
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Space.width(20),
                                              AppText(
                                                appText: allProductData[
                                                    "subcategory"],
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle(
                                                  color: ColorRes.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Space.width(5),
                                              // AppText(
                                              //   appText: '(Medium)',
                                              //   textAlign: TextAlign.center,
                                              //   style: AppTextStyle(
                                              //     color: ColorRes.black,
                                              //     fontSize: 13,
                                              //     fontWeight: FontWeight.bold,
                                              //   ),
                                              // ),
                                              Space.width(15),
                                            ],
                                          ),
                                          // Product Prices
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Space.width(20),
                                              const Icon(
                                                Icons.currency_rupee_outlined,
                                                size: 15,
                                              ),
                                              AppText(
                                                appText:
                                                    "${allProductData["price"]}",
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
                                                appText:
                                                    "${allProductData["discountPrice"]}",
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle(
                                                  color: ColorRes.grey696969,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Space.height(10),
                                          // Product Weight
                                          Space.height(10),
                                          // Add Button
                                          GestureDetector(
                                            onTap: () {
                                              var selectedProduct =
                                                  allProductData;
                                              print(selectedProduct);
                                              CartItem.addToCart(
                                                  selectedProduct); //
                                              recentlyView(selectedProduct);// Call addToCart function with selectedProduct
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Item added to cart.'),
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
                                          Space.height(30),
                                        ],
                                      ),

                                      GestureDetector(
                                        onTap: () {

                                            selectedProduct = allProductData;
                                            allProductData['favorit'] = true;


                                            if(fovController.cartItems1.any((e) => e['subcategory'] == selectedProduct['subcategory']))
                                            {

                                            }
                                            else
                                              {
                                                CartItem.addToFavorites(
                                                    selectedProduct);
                                              }
                                            fovController.fetchCartItems();
                                        },
                                        child: Obx(() => fovController.cartItems1.any((e) => e['subcategory'] == allProductData['subcategory'])
                                            ? Icon(CupertinoIcons.heart_fill, color: Colors.red,)
                                            : Icon(CupertinoIcons.heart),),
                                      ),
                                      SizedBox(width: 1),
                                    ],
                                  ),
                                ),
                              );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }


 Future recentlyView(Map<String, dynamic> productData)
  async{
    CartItem cartItem = CartItem(
      subcategory: productData['subcategory'] ?? "",
      imageUrls: productData['imageUrl'] ?? "",
      quantity: productData['quantity'] ?? 1,
      // Default quantity is 1
      price: productData['price'] ?? "",
      // Default price is 0
      discountPrice:
      productData['discountPrice'] ?? "", // Default discount price is 0
    );
    String uid = sharedPreferences.getString("uid") ?? "";

    Map<String, dynamic> data = {
      "subcategory": cartItem.subcategory,
      "imageUrls": cartItem.imageUrls,
      "quantity": cartItem.quantity,
      "price": cartItem.price,
      "discountPrice": cartItem.discountPrice,
    };
    k.add(data);
    await FirebaseFirestore.instance
        .collection("recentlyview")
        .doc("$uid")
        .set({"subcategory": k});
  }


  Future<void> _fetchFavorites() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('favorites').get();
    setState(() {
      favoriteItemIds = snapshot.docs.map((doc) => doc.id).toSet();
    });
  }

  Future<void> _toggleFavorite(String itemId) async {
    final favoritesCollection =
        FirebaseFirestore.instance.collection('favorites');
    final isFavorite = favoriteItemIds.contains(itemId);
    if (isFavorite) {
      await favoritesCollection.doc(itemId).delete();
    } else {
      await favoritesCollection.doc(itemId).set({});
    }
    _fetchFavorites();
  }
}
