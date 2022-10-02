import 'dart:math';

import 'package:flutter/material.dart';

class AppointmentViewModel extends ChangeNotifier {
  final List<Widget> tabs = [
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        'UPCOMING',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      )),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        'PREVIOUS',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      )),
    ),
  ];

  final List<Color> cardColors = [
    const Color(0xff21ABA5).withOpacity(0.4),
    const Color(0xffFDDB3A).withOpacity(0.4),
    const Color(0xff29DE92).withOpacity(0.4),
    const Color(0xfff1b2dc),
    const Color(0xff9a93bc),
    const Color(0xfffec3b4),
    const Color(0xfffec2b4),
    const Color(0xfff4f7ff),
    const Color(0xfffff3f0),
  ];

  int selectRandomColor() {
    return Random().nextInt(cardColors.length);
  }
}
