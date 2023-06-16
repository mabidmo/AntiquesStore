import 'package:antiques_store2/AuthenticationService.dart';
import 'package:antiques_store2/Login/LoginWidget.dart';
import 'package:antiques_store2/main.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpWidget extends StatefulWidget {
  static String routeName = "/SignUp";
  // final Function()? onTap;
  final Function() onClickedSignIn;

  const SignUpWidget({
    super.key,
    required this.onClickedSignIn,
    // required this.onTap,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          width: 150,
                          height: 150,
                          child: Image.asset(
                            "assets/images/Logo Black.png",
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 50, bottom: 20),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Register',
                          style: TextStyle1,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 314,
                      child: TextFormField(
                          controller: nameController,
                          style: TextStyle3,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Nama",
                              hintText: 'Masukkan Nama Anda',
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
                    Container(
                      height: 60,
                      width: 314,
                      child: TextFormField(
                          controller: emailController,
                          style: TextStyle3,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid Email'
                                  : null,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                                  Icons.email,
                                  color: kPrimaryColor,
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 314,
                      child: TextFormField(
                          controller: passwordController,
                          style: TextStyle1,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Enter a valid Email'
                                  : null,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Password",
                              hintText: 'Masukkan Password',
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
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 314,
                      child: TextFormField(
                          controller: confirmPasswordController,
                          style: TextStyle1,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Re-Password",
                              hintText: 'Ulangi Password',
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
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: signUserUp,
                      style: RoundedButtonStyle,
                      child: Container(
                        width: 280,
                        height: 60,
                        child: Center(
                          child: Text('Masuk', style: TextStyle2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, Login.routeName);
                    //   },
                    //   child: Text(
                    //     "Sudah Punya Akun? Login",
                    //     style: TextStyle(decoration: TextDecoration.underline),
                    //   ),

                    // ),

                    // GestureDetector(
                    //   child: Text(
                    //     'Sudah punya akun? Login',
                    //     style: TextStyle(
                    //       decoration: TextDecoration.underline,
                    //     ),
                    //   ),
                    //   onTap: () => Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           LoginWidget(onClickedSignUp: () {}),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  // Future signUp() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  //   ;

  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }

  // void createUser() async {
  //   dynamic result = await _auth.createNewUser(
  //       nameController.text, emailController.text, passwordController.text);
  //   if (result == null) {
  //     print('Email is not valid');
  //   } else {
  //     print(result.toString());
  //     nameController.clear();
  //     passwordController.clear();
  //     emailController.clear();
  //     Navigator.pop(context);
  //   }
  // }

  void signUserUp() async {
    // show loading circle
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message, passwords don't match
        showErrorMessage("Passwords don't match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
