import 'package:electronics_app/services/fov_conteroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/screen/checkout.dart';
import 'package:electronics_app/screen/favorite_screen.dart';
import 'package:electronics_app/services/fov_conteroller.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../cartmodel.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.allProductData,
    required this.description,
  });

  final String image;
  final String name;
  String price;
  final String description;
  var allProductData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  FovController fovController = Get.put(FovController());

  var selectedProduct;

  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        title: AppText(
          appText: 'Vegetable Detail',
          style: AppTextStyle(
              color: ColorRes.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 28,
            color: ColorRes.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckOutScreen(),
                  ));
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 28,
              color: ColorRes.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
          Space.height(20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Space.height(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Price : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.currency_rupee_outlined,
                          size: 18,
                        ),
                        Text(
                          "${widget.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0),
              //   child: Container(
              //     height: 32,
              //     width: 100,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: ColorRes.green45BC1B),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         GestureDetector(
              //             onTap: decrementQuantity,
              //             child: const Icon(Icons.remove)),
              //         AppText(
              //             appText: "$quantity",
              //             textAlign: TextAlign.center,
              //             style: AppTextStyle(
              //                 color: ColorRes.black,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold)),
              //         GestureDetector(
              //           onTap: incrementQuantity,
              //           child: const Icon(
              //             Icons.add,
              //             color: ColorRes.black,
              //             size: 15,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(width: 20),
            ],
          ),
          Space.height(20),
          Divider(
            indent: MediaQuery.of(context).size.width / 20,
            endIndent: MediaQuery.of(context).size.width / 20,
          ),
          Space.height(10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Space.height(15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              widget.description,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Space.height(15),
          Divider(
            indent: MediaQuery.of(context).size.width / 20,
            endIndent: MediaQuery.of(context).size.width / 20,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      CartItem.addToCart(widget.allProductData);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content:
                          Text('Item added to cart.'),
                        ),
                      );

                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: ColorRes.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: ColorRes.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
