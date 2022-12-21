import 'package:flutter/material.dart';
import 'package:hadir_bu/pages/homeScreen.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/loadinganimate.dart';
import 'package:page_transition/page_transition.dart';
import '../controller/APIController.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(content: Loadinganimate("Login"));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  SafeArea(
                      child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                            style: TextStyle(fontFamily: 'Poppins'),
                            textAlign: TextAlign.center,
                            controller: username,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(fontFamily: 'Poppins'))),
                        width: 283,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(18))),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  SafeArea(
                      child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                            style: TextStyle(fontFamily: 'Poppins'),
                            textAlign: TextAlign.center,
                            obscureText: true,
                            controller: password,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(fontFamily: 'Poppins'))),
                        width: 283,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(18))),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () async {
                      showLoaderDialog(context);
                      var pindah =
                          await API.login(username.text, password.text);
                      if (pindah != 'dilarang') {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: HomeScreen(variabel: pindah)));
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Masuk",
                      style: mediumText,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
