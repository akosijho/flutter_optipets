import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PetProfileView extends StatelessWidget {
  const PetProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: thisAppbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shrinkWrap: true,
        children: [
          petStats(
              SvgIcons.pawOutlined, "Spaniel", "10.3 kg", "03.31.19", "Male"),
        ],
      ),
    );
  }

  PreferredSize thisAppbar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(Get.context!).size.width, 80),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pet Name",
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(Get.context!).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "September 2022",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color:
                          Theme.of(Get.context!).primaryColor.withOpacity(0.7),
                    ),
                  ),
                ]),
            Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(SvgImages.temp)),
          ],
        ),
      ),
    );
  }

  Widget petStats(String specieIcon, String breed, String weight,
      String birthday, String gender) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: 104,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Theme.of(Get.context!).disabledColor),
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  breed,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(specieIcon),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weight,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.weighOutlined),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  birthday,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.cakeOutlined),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  gender,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.genderOutlined),
              ]),
        ],
      ),
    );
  }
}
