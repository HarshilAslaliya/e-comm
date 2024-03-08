import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronics_app/main.dart';


Future<List<Map<String, dynamic>>> fetchSubcategoriesAndImages(String category) async {
  List<Map<String, dynamic>> subcategories = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: category)
        .get();

    querySnapshot.docs.forEach((doc) {
      List<dynamic> subcategoryList = doc['subcategory'];
      List<dynamic> imageUrlList = doc['imageUrls'];
      List<dynamic> description = doc['description'];
      List<dynamic> price = doc['price'];
      List<dynamic> discountPrice = doc['discountPrice'];

      for (int i = 0; i < subcategoryList.length; i++) {
        subcategories.add({
          'subcategory': subcategoryList[i],
          'imageUrl': imageUrlList[i],
          'description': description[i],
          'price': price[i],
          'discountPrice': discountPrice[i],
          'id': doc['id']
        });
      }
    });
  } catch (e) {
    print('Error fetching subcategories: $e');
  }

  return subcategories;
}


Future<List<Map<String, dynamic>>> fetchRecentlyView() async {
  List<Map<String, dynamic>> subcategories = [];

  String uid = sharedPreferences.getString("uid") ?? "";
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('recentlyview')
        .where("$uid")
        .get();

    querySnapshot.docs.forEach((doc) {
      List<Map<String, dynamic>> proidc = doc['subcategory'];

      subcategories = proidc;
    });
  } catch (e) {
    print('Error fetching subcategories: $e');
  }

  return subcategories;
}
