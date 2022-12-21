import 'package:flutter/material.dart';
import 'package:hadir_bu/pages/homeScreen.dart';
import 'package:hadir_bu/pages/loginScreen.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/splashloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import '../controller/APIController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citranet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  cek() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 5));
    if (prefs.getString('user') == null &&
        prefs.getString('password') == null) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
      print("Coba");
    } else {
      var pindah =
          await API.login(prefs.getString('user'), prefs.getString('password'));
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: HomeScreen(
                variabel: pindah,
              )));
    }
  }

  @override
  void initState() {
    cek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 2000),
          child: Splashloading(),
        ),
      )),
    );
  }
}
