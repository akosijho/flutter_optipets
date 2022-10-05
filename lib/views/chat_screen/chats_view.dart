import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Chats", isChats: true),
      body: SizedBox(
        width: deviceWidth,
        child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => PetItem(
                  showActions: false,
                  isInChatPage: true,
                  name: "Pet Name",
                  breed: "Owned by Owner Name",
                  image: SvgImages.tempProfile,
                ),
            separatorBuilder: (context, _) => const SizedBox(height: 2),
            itemCount: 20),
      ),
    );
  }
}
