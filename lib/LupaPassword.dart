import 'package:antiques_store2/Login.dart';
import 'package:antiques_store2/Register.dart';
import 'package:flutter/material.dart';
import 'package:antiques_store2/utils/constanst.dart';

class LupaPassword extends StatelessWidget {
  static String routeName = "/LupaPassword";
  FocusNode focusNode = FocusNode();
  bool remember = false;
  bool rememberMe = false;
  bool? check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //Gambar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      "assets/images/Logo Black.png",
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 20, bottom: 20),
                  child: Container(
                    width: 314,
                    child: Text(
                      'Masukkan Email anda di sini, Untuk me-reset Password anda',
                      style: TextStyle3,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 314,
                  child: TextFormField(
                      focusNode: focusNode,
                      style: TextStyle3,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Email",
                          hintText: 'Masukkan Email',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 20),
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: kPrimaryColor),
                          labelStyle: TextStyle(color: kPrimaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            gapPadding: 13,
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                          suffixIcon: Align(
                            widthFactor: 3,
                            child: Icon(
                              Icons.person_sharp,
                              color: kPrimaryColor,
                            ),
                          ))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: RoundedButtonStyle,
                  child: Container(
                    width: 280,
                    height: 60,
                    child: Center(
                      child: Text('Send Email', style: TextStyle2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Belum Punya Akun? Daftar",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ));
        }));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
