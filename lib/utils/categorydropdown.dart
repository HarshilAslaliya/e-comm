import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import '../constants/app_size_constants.dart';

class CategoryDropdown extends StatefulWidget {
  final String categoryName;
  final List<String> subcategories;

  const CategoryDropdown({
    Key? key,
    required this.categoryName,
    required this.subcategories,
  }) : super(key: key);

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: ColorRes.grey505050),
                borderRadius: BorderRadius.circular(10),
                color: ColorRes.whiteF5F9FF),
            child: Row(
              children: [
                // SvgPicture.asset(ImageRes.stawbery),
                Space.width(20),
                AppText(
                  appText: widget.categoryName,
                  style: AppTextStyle(
                    fontSize: 15,
                    color: ColorRes.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Icon(
                    _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: ColorRes.splash472D2D,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            // width: MyAppSize.safeWidth,
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // decoration: BoxDecoration(
            //     border: Border.all(color: ColorRes.grey505050),
            //     borderRadius: BorderRadius.circular(10),
            //     color: ColorRes.whiteF5F9FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.subcategories.map((subcategory) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: AppText(
                        appText: subcategory,
                        style: AppTextStyle(
                          fontSize: 15,
                          color: ColorRes.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      child: Divider(),
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        Space.height(10),
      ],
    );
  }
}
