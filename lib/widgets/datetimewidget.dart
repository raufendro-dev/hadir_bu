import 'package:flutter/material.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:intl/intl.dart';

class Datetimewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Waktu : ",
              style: mediumText.copyWith(color: blackColor, fontSize: 16),
            ),
            Text(
              DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now()),
              style: lightText.copyWith(color: blackColor, fontSize: 16),
            ),
          ],
        ));
      },
    );
  }
}
