import 'package:flutter/material.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:hadir_bu/widgets/datetimewidget.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.dataUser});

  var dataUser;

  @override
  void initState() {}

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
          )
        ],
      )),
    );
  }
}
