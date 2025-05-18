import 'package:flutter/material.dart';
import 'package:machine_project_2/Repository/screens/Homescreen/homescreen.dart';
import 'package:machine_project_2/widget/Uihelper.dart';

class navigationscreen extends StatefulWidget {
  const navigationscreen({super.key});

  @override
  State<navigationscreen> createState() => _navigationscreenState();
}

class _navigationscreenState extends State<navigationscreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    Homescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: "home1.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: "category1.png"),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: "deal.png"),
            label: "Deals",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: "cart.png"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: "profile.png"),
            label: "profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
