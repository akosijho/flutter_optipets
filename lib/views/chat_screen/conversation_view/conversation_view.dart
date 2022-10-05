import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              SvgImages.tempProfile,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 16,
            ),
            Text("Owner Name",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).textTheme.headline2!.color,
            ),),
          ],
        ),
        isInConversationView: true,
        isChats: true,
      ),
    );
  }
}
