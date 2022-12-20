import 'package:flutter/material.dart';
import 'package:hadir_bu/theme/colorPalette.dart';
import 'package:hadir_bu/theme/textStyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loadinganimate extends StatelessWidget {
  final String namaloading;
  Loadinganimate(this.namaloading);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2, right: 5),
          child: LoadingAnimationWidget.twoRotatingArc(
            color: greenColor,
            size: 20,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              namaloading,
              style: mediumText,
            )),
      ],
    );
  }
}
