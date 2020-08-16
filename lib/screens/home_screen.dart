import 'package:flutter/material.dart';

import './components/body.dart';
import '../constants.dart';
import './components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
        ),
        onPressed: () {},
      ),
    );
  }
}
