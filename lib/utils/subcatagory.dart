import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/constants/imageres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubcategoryItem extends StatelessWidget {
  final String subcategory;
  final String imageUrl;
  final int price;
  final int discountPrice;

  const SubcategoryItem({
    required this.subcategory,
    required this.imageUrl,
    required this.price,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorRes.whiteE8F1FF,
      ),
      child: Row(
        children: [
          // Image
          SizedBox(
            height: 135,
            width: 130,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorRes.greyC4C4C4,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                if (discountPrice > 0)
                  Positioned(
                    top: 35,
                    child: Container(
                      height: 26,
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: ColorRes.blue,
                      ),
                      child: Center(
                        child: Text(
                          '30% Off',
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
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.height(30),
                Row(
                  children: [
                    Space.width(20),
                    AppText(
                      appText: subcategory,
                      style: AppTextStyle(
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Space.width(5),
                    SvgPicture.asset(ImageRes.greenicon),
                  ],
                ),
                Row(
                  children: [
                    Space.width(20),
                    const Icon(
                      Icons.currency_rupee_outlined,
                      size: 15,
                    ),
                    AppText(
                      appText: '$price',
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
                      appText: '$discountPrice',
                      style: AppTextStyle(
                        color: ColorRes.grey696969,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Space.height(10),
                // Other details like quantity selection and add button
                // Add your code here
                Space.height(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
