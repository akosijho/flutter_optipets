import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/splash_screen/splash_screen_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, child, viewModel) {
          return Scaffold(
            backgroundColor: MyColors.blue1,
            body: Center(
              child: SvgPicture.asset(SvgImages.logo),
            ),
          );
        });
  }
}
