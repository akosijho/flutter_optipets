import 'package:flutter/material.dart';

class AppointmentViewModel extends ChangeNotifier {
  final List<Widget> tabs = [
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: Text('UPCOMING',style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),)),
    ),
     const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: Text('PREVIOUS',style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),)),
    ),
  ];
}
