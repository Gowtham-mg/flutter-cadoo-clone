import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/screens/balance/funds_screen.dart';
import 'package:cadoo/screens/connections.dart';
import 'package:cadoo/screens/home.dart';
import 'package:cadoo/screens/profile/profile.dart';
import 'package:cadoo/screens/top_winners.dart';
import 'package:cadoo/utils/status_bar_color_changer.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return StatusBarColorChanger(
      androidStatusBarColor: MetaAsset.black,
      androidIconBrightness: Brightness.light,
      iosStatusBarBrightness: Brightness.light,
      child: Scaffold(
        backgroundColor: MetaAsset.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
            width: _width,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Visibility(
                  visible: index == 2,
                  child: HomeScreen(),
                ),
                Visibility(
                  visible: index == 1,
                  child: MyBalanceScreen(),
                ),
                Visibility(
                  visible: index == 4,
                  child: ProfileScreen(),
                ),
                Visibility(
                  visible: index == 3,
                  child: TopWinners(),
                ),
                Visibility(
                  visible: index == 0,
                  child: ConnectionsScreen(),
                ),
              ],
            ),
          );
          }
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MetaAsset.black,
          selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
          unselectedIconTheme:
              IconThemeData(color: Colors.grey.shade800, size: 30),
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (int _index) {
            setState(() {
              index = _index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.support), label: "Connections"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "My Balance"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wine_bar), label: "Top Winners"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
