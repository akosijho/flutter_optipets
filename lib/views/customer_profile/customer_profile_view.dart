import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';

class CustomerProfileView extends StatelessWidget{
  const CustomerProfileView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: myAppBar("Me"),
      body: Center(
        child: myCircularProgress(),
      ),
      bottomNavigationBar: const MyBottomAppBar(
        isProfile: true,
      ),
    );
  }
}