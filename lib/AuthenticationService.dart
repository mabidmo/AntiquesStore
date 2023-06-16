import 'package:antiques_store2/Home/Home.dart';
import 'package:antiques_store2/Login/LoginWidget.dart';
import 'package:antiques_store2/Register/SignUpWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// registration with email and password

  Future createNewUser(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Home();
    } catch (e) {
      print(e.toString());
    }
  }

// sign with email and password

  // Future loginUser(String email, String password) async {
  //   try {
  //      result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return result.user;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// signout

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignUp: toggle)
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}

// class LoginOrRegisterPage extends StatefulWidget {
//   const LoginOrRegisterPage({super.key});

//   @override
//   State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
// }

// class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
//   // initially show login page
//   bool showLoginPage = true;

//   // toggle between login and register page
//   void togglePages() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginWidget(
//         onTap: togglePages,
//       );
//     } else {
//       return SignUpWidget();
//     }
//   }
// }
