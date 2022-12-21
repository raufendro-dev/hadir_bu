import 'package:flutter/material.dart';
import 'package:hadir_bu/provider/riwayatProvider.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/datetimewidget.dart';
import 'package:hadir_bu/widgets/riwayat.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
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
                    onPressed: () {},
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
            padding: EdgeInsets.only(top: 40),
            child: Consumer<RiwayatProvider>(
              builder: (context, value, child) {
                final riwayat = value.riwayat;
                return Container(
                    height: 400,
                    child: RefreshIndicator(
                        child: Scrollbar(
                            isAlwaysShown: true,
                            child: ListView.builder(
                                itemCount: riwayat.length,
                                itemBuilder: ((context, index) {
                                  final riw = riwayat[index];
                                  return RiwayatWidget(
                                      riw.status, riw.tanggal, riw.username);
                                }))),
                        onRefresh: refresh));
              },
            ),
          )
        ],
      )),
    );
  }
}
