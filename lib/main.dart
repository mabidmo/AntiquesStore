import 'package:antiques_store2/AuthenticationService.dart';
import 'package:antiques_store2/Home/Home.dart';
import 'package:antiques_store2/routes.dart';
import 'package:antiques_store2/todoProvider.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SplashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'Firebase Auth';
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        // scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Antiques Store",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went worng!'));
          } else if (snapshot.hasData) {
            return Home();
          } else {
            return AuthPage();
          }
        },
        // (context, snapshot) {
        //   // user is logged in
        //   if (snapshot.hasData) {
        //     return Home();
        //   }

        //   // user is NOT logged in
        //   else {
        //     return LoginOrRegisterPage();
        //   }
        // },
      ));
}
