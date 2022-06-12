import 'package:flutter/material.dart';
import 'package:frontend/features/control/views/control_view.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:frontend/widgets/transparent_app_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;

  Widget currentView() {
    switch (_currentIndex) {
      case 0:
        return Text("Data");
      case 1:
        return ControlView();
      case 2:
        return Center(
            child: Text(
          "Profile",
          style: WeedTextTheme.of(context).headline2.bold,
        ));
      default:
        return Center(child: Text("Not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: "No Weed",
        icon: Icons.menu,
      ),
      body: currentView(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Data
          SalomonBottomBarItem(
            icon: Icon(Icons.data_saver_off),
            title: Text("Data"),
            selectedColor: Colors.pink,
          ),

          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.lightGreen,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
