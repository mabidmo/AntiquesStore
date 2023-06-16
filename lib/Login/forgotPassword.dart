import 'package:antiques_store2/Register/SignUpWidget.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
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
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 20, bottom: 20),
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
                            controller: emailController,
                            style: TextStyle3,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
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
                                    Icons.person_sharp,
                                    color: kPrimaryColor,
                                  ),
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: resetPassword,
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
                      // GestureDetector(
                      //   child: Text(
                      //     'Belum Punya Akun? Register',
                      //     style: TextStyle(
                      //       decoration: TextDecoration.underline,
                      //     ),
                      //   ),
                      //   onTap: () => Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           SignUpWidget(onClickedSignIn: () {}),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Future resetPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      _dialogBuilder(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text(
              'Reset password akan dikirim melalui email anda \nMohon cek email!'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Mengerti'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
