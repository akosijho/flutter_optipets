import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/my_colors.dart';

Center myCircularProgress() {
  return  const Center(
    child: CircularProgressIndicator(
      color: MyColors.yellow,
    ),
  );
}
