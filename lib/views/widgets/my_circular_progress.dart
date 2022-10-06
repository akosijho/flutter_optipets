import 'package:flutter/material.dart';
// import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

Center myCircularProgress() {
  return  
   Center(
    child: 
    // CircularProgressIndicator(
    //   color: MyColors.yellow,
    // ),
    Lottie.asset("lib/resources/assets/lotties/heartbeat.json",
    width: 96,
    height: 96,
    frameRate: FrameRate(60),
    ),
  );
}
