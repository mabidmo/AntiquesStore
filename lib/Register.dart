// import 'package:antiques_store2/Login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:antiques_store2/utils/constanst.dart';

// class Register extends StatelessWidget {
//   static String routeName = "/Register";
//   FocusNode focusNode = FocusNode();
//   bool remember = false;
//   bool rememberMe = false;
//   bool? check1 = false;

//   void _onRememberMeChanged(bool newValue) => setState(() {
//         rememberMe = newValue;

//         if (rememberMe) {
//           // TODO: Here goes your functionality that remembers the user.
//         } else {
//           // TODO: Forget the user
//         }
//       });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//     );
//   }
// }

// void setState(Null Function() param0) {}

// class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
//   const CustomAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Builder(builder: (BuildContext context) {
//           return IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ));
//         }));
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(50.0);
// }
