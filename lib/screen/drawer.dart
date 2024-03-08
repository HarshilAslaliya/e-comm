import 'package:electronics_app/constants/app_size_constants.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<String> drawerData = [
    "Home",
    "My Account",
    "Smart Basket / My List",
    "Shop By Category",
    "Offers",
    "The Beauty Store",
    "Customer Services",
    "Rate & Review Products",
    "Gift Card",
    "Notifications",
    "Terms & Conditions",
    "Logout"
  ];

  @override
  Widget build(BuildContext context) {
    MyAppSize().init(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemCount: drawerData.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 200,
                color: ColorRes.blue,
                child: Container(
                  height: 250,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorRes.blue,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 310,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorRes.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: AppText(
                                appText: 'Hello, Jeffrey A. Gibson',
                                style: AppTextStyle(
                                    fontSize: 18,
                                    color: ColorRes.white,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Space.height(20),
                        Container(
                          height: 70,
                          width: 310,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorRes.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            final item = drawerData[index - 1];
            IconData? iconData;
            switch (item) {
              case 'My Account':
                iconData = Icons.account_circle;
                break;
              case 'Shop By Category':
                iconData = Icons.category;
                break;
              case 'FAQs':
                iconData = Icons.help;
                break;
              default:
                iconData = null;
            }

            return ListTile(
              trailing: iconData != null ? Icon(iconData) : null,
              title: Text(item),
              onTap: () {
                // Add functionality for drawer items
              },
            );
          },
        ),
      ),
    );
  }
}
