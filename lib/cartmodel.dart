import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem {
  String? subcategory;
  String? imageUrls;
  int? quantity;
  String? price;
  String? discountPrice;
  bool? favorit;

  CartItem({
    @required this.subcategory,
    @required this.imageUrls,
    @required this.quantity,
    @required this.price,
    @required this.discountPrice,
    @required this.favorit,
  });

  static Future<void> addToCart(Map<String, dynamic> productData) async {
    try {
      CartItem cartItem = CartItem(
        subcategory: productData['subcategory'] ?? "",
        imageUrls: productData['imageUrl'] ?? "",
        quantity: productData['quantity'] ?? 1,
        // Default quantity is 1
        price: productData['price'] ?? 0,
        // Default price is 0
        discountPrice:
            productData['discountPrice'] ?? 0, // Default discount price is 0
      );

      CollectionReference cartCollection =
          FirebaseFirestore.instance.collection("cartItem");
      Map<String, dynamic> data = {
        "subcategory": cartItem.subcategory,
        "imageUrls": cartItem.imageUrls,
        "quantity": cartItem.quantity,
        "price": cartItem.price,
        "discountPrice": cartItem.discountPrice,
      };
      await cartCollection.add(data);
      print("Item added to cart successfully!");
    } catch (e) {
      print("Error adding item to cart: $e");
      // Handle the error as needed, e.g., show a snackbar or display an error message
    }
  }

  static Future<void> addToFavorites(Map<String, dynamic> productData) async {
    try {
      CartItem cartItem = CartItem(
        subcategory: productData['subcategory'] ?? "",
        imageUrls: productData['imageUrl'] ?? "",
        quantity: productData['quantity'] ?? 1,
        // Default quantity is 1
        price: productData['price'] ?? 0,
        favorit: productData['favorit'] ,
        // Default price is 0
        discountPrice:
        productData['discountPrice'] ?? 0, // Default discount price is 0
      );

      CollectionReference cartCollection = FirebaseFirestore.instance.collection("favoriteProduct");
      Map<String, dynamic> data = {
        "subcategory": cartItem.subcategory,
        "imageUrls": cartItem.imageUrls,
        "quantity": cartItem.quantity,
        "price": cartItem.price,
        "discountPrice": cartItem.discountPrice,
        "favorit":cartItem.favorit
      };
      await cartCollection.add(data);
      print("Item added to cart successfully!");
    } catch (e) {
      print("Error adding item to cart: $e");
      // Handle the error as needed, e.g., show a snackbar or display an error message
    }
  }

}


