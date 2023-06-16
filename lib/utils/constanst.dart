import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color.fromARGB(255, 8, 17, 92);
const kSecondaryColor = Color.fromARGB(255, 217, 217, 217);
const kThirdColor = Colors.black;

var TextStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400, color: kPrimaryColor, fontSize: 14);
var TextStyle2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14);
var TextStyle3 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14);
var TextStyleBold3 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14);
var TextProduct = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 17);

final ButtonStyle RoundedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: kPrimaryColor,
  primary: kPrimaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
);
final ButtonStyle RoundedButtonStyle2 = ElevatedButton.styleFrom(
  onPrimary: kSecondaryColor,
  primary: kSecondaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
);

// class Utils {

//   final messengerKey = GlobalKey<ScaffoldMessengerState>();

//   static showSnackBar(String? text) {
//     if (text == null) return;

//     final SnackBar = SnackBar(
//       content: Text(text),
//     );

//     messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(SnackBar);
//   }
// }
