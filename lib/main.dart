import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflix/auth/login.dart';
import 'package:netflix/screens/home.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}


