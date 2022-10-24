import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ProfileImage extends ViewModelWidget<CustomerProfileViewModel> {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CustomerProfileViewModel viewModel) {
    return Container(
      height: 284,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).toggleableActiveColor.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      backgroundImage: viewModel.imageFile != null
                          ? FileImage(File(viewModel.imageFile!.path))
                          : null,
                      child: viewModel.imageFile != null
                          ? null
                          : Image.asset(SvgImages.tempProfile),
                    ),
                  ),
                  Positioned(
                      top: 120,
                      right: 24,
                      child: IconButton(
                        onPressed: () async {
                          await viewModel.picker();
                        },
                        icon: SvgPicture.asset(SvgIcons.pencilRound),
                      )),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(viewModel.user.name!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.headline6!.color,
                  )),
              Text(viewModel.user.contacts!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .textTheme
                        .headline6!
                        .color!
                        .withOpacity(0.7),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
