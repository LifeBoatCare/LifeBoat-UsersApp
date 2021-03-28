import 'package:flutter/material.dart';

import 'package:flutter_app/UI/Screens/bottomNavbar.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(body: BottomNavbar());
  }
}
