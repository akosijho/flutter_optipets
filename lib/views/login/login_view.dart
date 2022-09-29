import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/login/login_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameFieldController =
        TextEditingController();
    final TextEditingController passwordFieldController =
        TextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, child, viewModel) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: MyColors.blue1,
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(SvgImages.logo, width: 196, height: 183),
                    const SizedBox(height: 4),
                    Text(
                      appName.toLowerCase(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    const Text(
                      "Sign in with your given account",
                      style: TextStyle(
                        color: MyColors.scaffoldBg,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 54),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: usernameFieldController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: Theme.of(context)
                                  .inputDecorationTheme
                                  .contentPadding,
                              label: const Text("Username"),
                              fillColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xff52575D),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xff52575D),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passwordFieldController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: Theme.of(context)
                                  .inputDecorationTheme
                                  .contentPadding,
                              label: const Text("Password"),
                              fillColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xff52575D),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xff52575D),
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff00BBF0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Login",
                              style: TextStyle(
                                fontSize: 32,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
