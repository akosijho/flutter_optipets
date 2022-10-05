import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetItem extends StatelessWidget {
  PetItem({
    Key? key,
    required this.showActions,
    required this.name,
    required this.breed,
    required this.image,
    required this.isInChatPage,
  }) : super(key: key);

  final String name, breed, image;
  final bool showActions, isInChatPage;
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        isInChatPage
            ? await applicationViewModel.navigationService
                .pushNamed(Routes.conversationView)
            : await applicationViewModel.navigationService
                .pushNamed(Routes.petProfile);
      },
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
                    child: Image.asset(image)),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      breed,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            showActions
                ? IconButton(
                    icon: SvgPicture.asset(
                      SvgIcons.infoIcon,
                      width: 24,
                    ),
                    onPressed: () {},
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
