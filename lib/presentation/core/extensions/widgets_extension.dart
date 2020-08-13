import 'package:flutter/material.dart';

extension PaddinExt on Widget {
  Widget padding(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget center() => Center(
        child: this,
      );
}
