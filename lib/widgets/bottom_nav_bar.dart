import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import '../views/home_screen/views/home_screen.dart';
import '../views/order_history_screen/views/order_history_screen.dart';
import '../views/profile_screen/views/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  final RxInt _selectedIndex = 1.obs;

  static const List<Widget> _widgetOptions = <Widget>[
    OrderHistoryScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
            () => Center(
          child: _widgetOptions.elementAt(_selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.lightBlue[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.location_on_outlined,
                  text: 'Location',
                ),
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person_pin_outlined,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex.value,
              onTabChange: (index) {
                _selectedIndex.value = index;
              },
            ),
          ),
        ),
      ),
    );
  }
}
// class ScreenController extends StatelessWidget {
//   ScreenController({Key? key}) : super(key: key);
//
//   final RxInt _currentIndex = 1.obs;
//
//   static const List<Widget> screens = <Widget>[
//     MessageScreen(),
//     HomeScreen(),
//     ProfileScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() => screens[_currentIndex.value]),
//       bottomNavigationBar: Obx(
//         () => (BottomNavigationBar(
//           currentIndex: _currentIndex.value,
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.location_on_rounded),
//               label: 'Location',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_pin),
//               label: 'Profile',
//             ),
//           ],
//           onTap: (index) {
//             _currentIndex.value = index;
//           },
//         )),
//       ),
//     );
//   }
// }

