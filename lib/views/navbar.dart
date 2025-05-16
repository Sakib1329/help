import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help/views/settingspage.dart';
import '../controllers/controller.dart';
import '../widgets/navbaritem.dart';
import 'chatpage.dart';
import 'homepage.dart';

class Navbar extends StatelessWidget {
  final controller = Get.put(NavController());

  // SVG icon asset paths
  final svgIcons = [
    'assets/icons/home.svg',
    'assets/icons/settings.svg',
    'assets/icons/chat.svg',
  ];

  // Labels for each tab
  final labels = [
    'Home',
    'Settings',
    'Chat',
  ];

  // Pages for each tab
  final pages = [
    Homepage(),
    Settingspage(),
    Chatpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the selected page in the body
      body: Obx(() => pages[controller.selectedIndex.value]),

      // Pass only svgIcons and labels to the nav bar
      bottomNavigationBar: Obx(() => CurvedBottomNavBar(
        selectedIndex: controller.selectedIndex.value,
        onItemTapped: controller.changePage,
        svgIcons: svgIcons,
        labels: labels,
      )),
    );
  }
}
