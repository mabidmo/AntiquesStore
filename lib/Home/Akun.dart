import 'package:antiques_store2/AuthenticationService.dart';
import 'package:antiques_store2/Home/Home.dart';
import 'package:antiques_store2/Login.dart';
import 'package:antiques_store2/Login/LoginWidget.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Akun extends StatefulWidget {
  static String routeName = "/Akun";
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final AuthenticationService _auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: appBarAkun(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(user.email!),
            ElevatedButton(
              onPressed: () async {
                await _auth
                    .signOut()
                    .then((result) => Navigator.of(context).pop(true));
              },
              child: Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: RoundedButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class appBarAkun extends StatelessWidget with PreferredSizeWidget {
  const appBarAkun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(57.0);
}
