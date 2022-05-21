import 'package:classes_and_groups_app/screens/home_screen_mobile.dart';
import 'package:classes_and_groups_app/screens/home_screen_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // check if we run on web
    if(kIsWeb) {
      return const MaterialApp(
        home: HomeScreenWeb(),
      );
    } else {
      return const MaterialApp(
        home: HomeScreenMobile(),
      );
    }
  }
}