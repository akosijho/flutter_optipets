import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

class PetScreenView extends StatelessWidget{
  const PetScreenView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopAppBar(label: 'Pets'),
          ],
        )),
    );
  }

}