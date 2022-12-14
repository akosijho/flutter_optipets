import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/input_validation_mixin.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/login/login_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget with InputValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: MyColors.blue1,
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(SvgImages.logo,
                            width: 196, height: 183),
                        Text(
                          appName.toLowerCase(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        const Text(
                          "Sign in with your given account",
                          style: TextStyle(
                            color: MyColors.scaffoldBg,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Form(
                            key: viewModel.applicationViewModel.formGlobalKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                TextFormField(
                                    controller:
                                        viewModel.usernameFieldController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color(0xff52575D),
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff52575D),
                                    ),
                                    validator: (email) => email!.isEmpty ? 'Enter your usename' : null,
                                    ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: viewModel.passwordFieldController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    isDense: true,
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xff52575D),
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff52575D),
                                  ),
                                  validator: (password) {
                                    if (isPasswordValid(password!)) {
                                      return null;
                                    } else {
                                      return 'Password must contain least 6 characters';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 48,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xff00BBF0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (viewModel.applicationViewModel
                                          .formGlobalKey.currentState!
                                          .validate()) {
                                        viewModel.signIn(
                                            viewModel
                                                .usernameFieldController.text,
                                            viewModel
                                                .passwordFieldController.text);
                                      }else{
                                        null;
                                      }
                                    },
                                    child: !viewModel.isBusy
                                        ? const Text(
                                            "Login",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
