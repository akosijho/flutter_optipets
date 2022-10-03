import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/views/customer_profile/profile_image.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomerProfileView extends StatelessWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: myAppBar("Me"),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ProfileImage(),
              const SizedBox(
                height: 32,
              ),
              _buildOption("Pets", SvgIcons.pawTilted, funcion: null),
              _buildOption("Edit Profile", SvgIcons.pencilBlackOutlined),
              _buildOption("About", SvgIcons.question),
              _buildOption("Sign Out", SvgIcons.signOut),
            ],
          )),
      bottomNavigationBar: const MyBottomAppBar(
        isProfile: true,
      ),
    );
  }

  Widget _buildOption(String label, String icon, {dynamic funcion}) {
    return InkWell(
      highlightColor: Theme.of(Get.context!).highlightColor.withOpacity(0.1),
      onTap: () {
       
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(Get.context!).size.width / 8,
            vertical: 4),
        child: Row(
          children: [
            Container(
                width: 48,
                height: 48,
                decoration: label != "Sign Out" ? BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                ) : null,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(icon),
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(label, style: Theme.of(Get.context!).textTheme.headline1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
