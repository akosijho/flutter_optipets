// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:get/get.dart';

SnackbarController showSnackbar(
    {required String title, required String message, Widget? icon}) {
  return Get.snackbar(
    title,
    message,
    icon: icon,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: MyColors.blueButtonColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(16),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(String label) =>
//     ScaffoldMessenger.of(getContext).showSnackBar(SnackBar(
//         backgroundColor: MyColors.blueButtonColor,
//         width: deviceWidth,
//         padding: const EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         duration: const Duration(milliseconds: 1500),
//         content: Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//           ),
//         )));
