import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetItem extends StatelessWidget {
  const PetItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(SvgImages.temp)),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pet Name",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Poodle",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: SvgPicture.asset(
                SvgIcons.infoIcon,
                width: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
