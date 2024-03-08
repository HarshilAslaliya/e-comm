import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FovController extends GetxController
{

  RxList cartItems1 = [].obs;

  Future<void> fetchCartItems() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("favoriteProduct").get();
        cartItems1.value = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        print(cartItems1);
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }
}
