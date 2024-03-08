// import 'package:flutter/material.dart';
// import 'package:grocery/constants/colorres.dart';
// import 'package:grocery/screen/homescreen.dart';
// import 'package:grocery/screen/menuscreen.dart';
// import 'package:grocery/screen/offerscreen.dart';
// import 'package:grocery/screen/profilescreen.dart';
//
// class DashBoardScreen extends StatefulWidget {
//   const DashBoardScreen({super.key});
//
//   @override
//   State<DashBoardScreen> createState() => _DashBoardScreenState();
// }
//
// class _DashBoardScreenState extends State<DashBoardScreen> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _selectedIndex == 0
//           ? const HomeScreen()
//           : _selectedIndex == 1
//               ? const MenuScreen()
//               : _selectedIndex == 2
//                   ? const OfferScreen()
//                   : const ProfileScreen(),
//       bottomNavigationBar: BottomNavigationBar(
//
//         backgroundColor: ColorRes.white,
//         currentIndex: _selectedIndex,
// // useLegacyColorScheme: false,
//         unselectedItemColor: ColorRes.purple2B0752,
//         selectedItemColor: ColorRes.green45BC1B,
//
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_filled,
//               color: ColorRes.green45BC1B,
//             ),
//             label: 'home',
//
//             // Set an empty label for the first item
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.menu,
//               color: ColorRes.green45BC1B,
//             ),
//             label: 'menu',
//             // Set an empty label for the second item
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.local_offer_outlined,
//               color: ColorRes.green45BC1B,
//             ),
//             label: 'offer',
//             // Set an empty label for the second item
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: ColorRes.green45BC1B,
//             ),
//             label: 'menu',
//             // Set an empty label for the second item
//           ),
//         ],
//         //   selectedLabelStyle: const TextStyle(color: Colors.greenAccent),
//       ),
//       floatingActionButton: FloatingActionButton(
//         clipBehavior: Clip.none,
//         shape: const CircleBorder(side: BorderSide.none),
//         onPressed: () {
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => const HomeScreen()));
//         },
//         backgroundColor: ColorRes.redF44831,
//         child: const Icon(
//           Icons.search,
//           size: 30,
//           color: ColorRes.white,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
