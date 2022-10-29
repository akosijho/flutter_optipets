import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view_model.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ProfileImage extends ViewModelWidget<CustomerProfileViewModel> {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CustomerProfileViewModel viewModel) {
    print(viewModel.user);
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
                      child: viewModel.user?.displayImage != null
                          ? CachedNetworkImage(imageUrl: viewModel.user!.displayImage!,
                          progressIndicatorBuilder:(context, url, downloadProgress) => myCircularProgress(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),)
                          :  Image.asset(SvgImages.tempProfile), 
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
              Text('${viewModel.user!.firstName!} ${viewModel.user!.lastName!}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.headline6!.color,
                  )),
              Text(viewModel.user!.contacts!,
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
