import 'package:flutter/material.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splashloading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Column(
        children: [
          Text(
            "Logo",
            style: lightText.copyWith(color: blackColor),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: LoadingAnimationWidget.stretchedDots(
              color: Colors.grey,
              size: 70,
            ),
          )
        ],
      ),
    );
  }
}
