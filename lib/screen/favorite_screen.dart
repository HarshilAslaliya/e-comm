import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/fav_detail.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Future<void> _updateQuantity(String productId, int newQuantity) async {
    if (newQuantity >= 1) {
      try {
        await FirebaseFirestore.instance
            .collection('favoriteProduct')
            .doc(productId)
            .update({'quantity': newQuantity});
      } catch (e) {
        // Handle error
        print('Error updating quantity: $e');
      }
    } else {
      print('Quantity cannot be less than 0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        centerTitle: true,
        title: AppText(
          appText: 'Wishlist',
          style: AppTextStyle(
              fontSize: 18, color: ColorRes.white, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("favoriteProduct")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No items found in the cart.');
                } else {
                  // Extract cart items from snapshot
                  List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                  return ListView.builder(
                    padding: const EdgeInsets.all(3),
                    itemCount: documents.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var cartItem = documents[index];

                      var allProductData =
                          snapshot.data!.docs;

                      return GestureDetector(
                        onTap: () {
                          print(documents[index]["imageUrls"]);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavDetail(
                                image: documents[index]["imageUrls"],
                                name: documents[index]["subcategory"],
                                price: documents[index]["price"],
                                allProductData: allProductData,
                                cartItem: cartItem,
                                description: documents[index]["description"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 142,
                          margin: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F8FE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 135,
                                    width: 135,
                                    child: Container(
                                      margin: const EdgeInsets.all(15),
                                      height: 144,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorRes.greyC4C4C4),
                                        borderRadius: BorderRadius.circular(20),
                                        // Display the image of the cart item
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              cartItem["imageUrls"]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    appText: cartItem["subcategory"],
                                    // Use the subcategory field
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle(
                                        color: ColorRes.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  cartItem.reference.delete();

                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ], // Your UI elements
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
