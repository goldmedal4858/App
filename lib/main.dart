import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login/login_page.dart';
import 'navigation_container.dart';



void main() {

  /*

  BURASI EKRANI YATAY YAPMAYI KAPATMAK İÇİN.

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home:LoginPage(),

    );
  }
}
