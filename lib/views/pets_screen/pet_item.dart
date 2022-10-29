import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetItem extends StatelessWidget {
  PetItem({super.key, 
    required this.petId,
    required this.petObject,
    required this.showActions,
    required this.isInChatPage,
  });

  final String petId;
  final PetObject petObject;
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
            : await applicationViewModel.navigationService.pushNamed(
                Routes.petProfile,
                arguments: PetProfileViewArguments(
                    petId: petId, petObject: petObject));
      },
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), //color of shadow
              blurRadius: 4, // blur radius
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        petObject.name!,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        petObject.breed!,
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
      ),
    );
  }
}
