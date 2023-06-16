import 'package:antiques_store2/Login/forgotPassword.dart';
import 'package:antiques_store2/LupaPassword.dart';
import 'package:antiques_store2/Register.dart';
import 'package:antiques_store2/Register/SignUpWidget.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:antiques_store2/main.dart';
import 'package:antiques_store2/AuthenticationService.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  // final Function()? onTap;

  const LoginWidget({
    super.key,
    required this.onClickedSignUp,
    // required this.onTap,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  static String routeName = "/Login";
  FocusNode focusNode = FocusNode();
  bool remember = false;
  bool rememberMe = false;
  bool? check1 = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kPrimaryColor,
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
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
                          const EdgeInsets.only(top: 8.0, left: 50, bottom: 20),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.start,
                          style: TextStyle3,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 314,
                      child: TextFormField(
                          controller: emailController,
                          focusNode: focusNode,
                          style: TextStyle3,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Username",
                              hintText: 'Masukkan Username',
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
                          controller: passwordController,
                          style: TextStyle3,
                          obscureText: true,
                          keyboardType: TextInputType.text,
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
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(43, 5, 43, 2),
                      child: Row(
                        children: [
                          Checkbox(
                              //only check box
                              value: check1, //unchecked
                              onChanged: (bool? value) {
                                //value returned when checkbox is clicked
                                setState(() {
                                  check1 = value;
                                });
                              }),
                          Text('Tetap Masuk'),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            ),
                            child: Text(
                              "Lupa Password",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => signUserIn(),
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
                    GestureDetector(
                      child: Text(
                        'Belum Punya Akun? Register',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SignUpWidget(onClickedSignIn: () {}),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future SignIn() async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => Center(
  //             child: CircularProgressIndicator(),
  //           ));
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }

  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }

  // void signInUser() async {
  //   dynamic authResult =
  //       await _auth.loginUser(emailController.text, passwordController.text);
  //   if (authResult == null) {
  //     print('Sign in error. could not be able to login');
  //   } else {
  //     emailController.clear();
  //     passwordController.clear();
  //     Navigator.pushNamed(context, '/Home');
  //   }
  // }
}

void setState(Null Function() param0) {}
