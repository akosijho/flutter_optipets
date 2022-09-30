import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

class PetScreenView extends StatelessWidget {
  const PetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Pets"),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const PetItem(),
            separatorBuilder: (context, _) => const SizedBox(height: 2),
            itemCount: 20),
      ),
      bottomNavigationBar: const MyBottomAppBar(
        isPets: true,
      ),
    );
  }
}
