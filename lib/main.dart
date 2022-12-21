import 'package:flutter/material.dart';
import 'package:hadir_bu/pages/loginScreen.dart';
import 'package:hadir_bu/pages/splashScreen.dart';
import 'package:hadir_bu/provider/riwayatProvider.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/splashloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RiwayatProvider(),
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
