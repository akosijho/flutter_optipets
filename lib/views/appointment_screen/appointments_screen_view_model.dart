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
  ];

  int selectRandomColor() {
    return Random().nextInt(cardColors.length);
  }
}
