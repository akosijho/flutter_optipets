import 'package:flutter/material.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view_model.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.viewModel}) : super(key: key);

  final CustomerProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
          child: StreamBuilder<UserObject>(
              stream: viewModel.userStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Column(
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
                              backgroundImage: snapshot.data!.displayImage !=
                                      null
                                  ? NetworkImage(snapshot.data!.displayImage!)
                                  : null,
                              child: snapshot.data!.displayImage != null
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
                      Text(
                          '${snapshot.data!.firstName!} ${snapshot.data!.lastName!}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).textTheme.headline6!.color,
                          )),
                      Text(snapshot.data!.contacts!,
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
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child:  Text('Something went wrong'),
                  );
                }

                return myCircularProgress();
              }),
        ),
      ),
    );
  }
}
