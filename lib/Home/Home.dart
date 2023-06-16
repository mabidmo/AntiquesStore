import 'package:antiques_store2/Home/Akun.dart';
import 'package:antiques_store2/Home/FavoritPage.dart';
import 'package:antiques_store2/Home/HomePage/HomePage.dart';
import 'package:antiques_store2/Home/Notifikasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constanst.dart';

class Home extends StatelessWidget {
  static String routeName = "/Home";
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      title: 'Floating Navigation Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int currentIndex = 0;

  var pageList = <Widget>[
    HomePage(),
    FavoritPage(),
    NotifikasiPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: pageList[currentIndex],
      bottomNavigationBar: FloatingNavigationBar(
        backgroundColor: kPrimaryColor,
        barHeight: 80.0,
        barWidth: MediaQuery.of(context).size.width - 30.0,
        iconColor: kSecondaryColor,
        textStyle: TextStyle(
          color: kSecondaryColor,
          fontSize: 14.0,
        ),
        iconSize: 20.0,
        indicatorColor: kSecondaryColor,
        indicatorHeight: 5,
        indicatorWidth: 14.0,
        items: [
          NavBarItems(
            icon: Icons.home,
            title: "Home",
          ),
          NavBarItems(
            icon: Icons.favorite,
            title: "Favorite",
          ),
          NavBarItems(
            icon: Icons.notifications,
            title: "Notification",
          ),
        ],
        onChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(),
        elevation: 0,
        flexibleSpace: Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              color: kPrimaryColor),
        ),
        leadingWidth: 2,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 33,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: kPrimaryColor)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        )),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed("/Akun");
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 35,
                  ),
                  highlightColor: kPrimaryColor,
                  splashColor: kPrimaryColor,
                ),
              ),
              Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed("/Akun");
                    },
                    icon: Icon(
                      Icons.person,
                      size: 20,
                      color: kPrimaryColor,
                    ),
                    highlightColor: kPrimaryColor,
                    splashColor: kPrimaryColor,
                  ))
            ],
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(57.0);
}
