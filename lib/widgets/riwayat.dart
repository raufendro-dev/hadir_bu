import 'package:flutter/material.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';

class RiwayatWidget extends StatelessWidget {
  final String status;
  final String tanggal;
  final String username;
  RiwayatWidget(this.status, this.tanggal, this.username);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              username,
              style: lightText.copyWith(color: blackColor, fontSize: 14),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                tanggal,
                style: lightText.copyWith(color: blackColor, fontSize: 14),
              ),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              status,
              style: lightText.copyWith(
                  color: status == 'masuk' ? greenColor : redColor,
                  fontSize: 14),
            ),
          ],
        ));
  }
}
