import 'package:flutter/material.dart';
import 'package:hadir_bu/controller/logoutController.dart';
import 'package:hadir_bu/pages/loginScreen.dart';

import 'package:hadir_bu/provider/riwayatProvider.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/datetimewidget.dart';
import 'package:hadir_bu/widgets/riwayat.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.variabel});
  var variabel;

  @override
  _HomeScreenState createState() => _HomeScreenState(dataUser: variabel);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({required this.dataUser});

  var dataUser;
  Future refresh() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RiwayatProvider>(context, listen: false).getAllRiwayat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                child: TextButton.icon(
                    onPressed: () async {
                      await Logout.logout();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: LoginScreen()));
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Keluar',
                      style:
                          TextStyle(color: Colors.red, fontFamily: 'Poppins'),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Container(
              height: 150,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.memory(
                    base64Decode(dataUser.gambar),
                  )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
              child: Text(
            dataUser.fullname,
            style: regularText.copyWith(color: blackColor, fontSize: 22),
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(child: Datetimewidget()),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  onPressed: () async {},
                  child: Text(
                    "Absen Masuk",
                    style: mediumText,
                  )),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  onPressed: () {},
                  child: Text(
                    "Absen Keluar",
                    style: mediumText,
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10, left: 40),
          child: Text(
            "Riwayat Absen",
            style: mediumText.copyWith(color: blackColor, fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 24),
          child: Consumer<RiwayatProvider>(
            builder: (context, value, child) {
              final riwayat = value.riwayat;
              return Container(
                  height: 350,
                  child: RefreshIndicator(
                      child: ListView.builder(
                          itemCount: riwayat.length,
                          itemBuilder: ((context, index) {
                            final riw = riwayat[index];
                            return RiwayatWidget(
                                riw.status, riw.tanggal, riw.username, index);
                          })),
                      onRefresh: refresh));
            },
          ),
        )
      ],
    ))));
  }
}
