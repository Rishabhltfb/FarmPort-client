import 'dart:developer';

import 'package:farmport_app/ui/common/illustration_holder.dart';
import 'package:farmport_app/ui/common/custom_text_field.dart';
import 'package:farmport_app/ui/screens/home/home_screen.dart';
import 'package:farmport_app/ui/utils/constants/assets.dart';
import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String route = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ValueNotifier<bool> isFarmer = ValueNotifier(true);
  ValueNotifier<bool> credFail = ValueNotifier(false);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailFarmer = 'farmer@farmport.in';
  String emailConsumer = 'consumer@farmport.in';
  String password = 'test';

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    SizedBox spacer = const SizedBox(height: 12);
    return Scaffold(
        backgroundColor: FarmPortColors.kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                Center(
                  child: IllustrationHolder(
                    height: height * 0.5,
                    width: width * 0.7,
                    illustration: FarmPortAssets.authIllustration,
                    text: 'Register User',
                    color: FarmPortColors.kWhiteColor,
                  ),
                ),
                spacer,
                spacer,
                selectSessionTypeRow(context),
                CustomTextField(
                  textEditingController: nameController,
                  hintText: 'Type your name here',
                  labelText: 'Name',
                ),
                spacer,
                CustomTextField(
                  textEditingController: emailController,
                  hintText: 'Type your email here',
                  labelText: 'Email',
                ),
                spacer,
                CustomTextField(
                    textEditingController: passwordController,
                    hintText: 'Type your password here',
                    labelText: 'Password',
                    isPassword: true),
                spacer,
                ValueListenableBuilder(
                    valueListenable: credFail,
                    builder: (context, value, child) => !credFail.value
                        ? const SizedBox()
                        : Text('Oops, email or password is not correct!',
                            style: kBody2.copyWith(
                                color: FarmPortColors.kRedColor))),
                spacer,
                ElevatedButton(
                    onPressed: () {
                      log('Button pressed');
                      // if (!authenticate()) {
                      //   return;
                      // }
                      credFail.value = false;
                      Navigator.of(context).pushNamed(HomeScreen.route);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            FarmPortColors.kWhiteColor)),
                    child: Text(
                      'Continue',
                      style: kBody2.copyWith(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget selectSessionTypeRow(BuildContext context) {
    SizedBox hspacer = const SizedBox(width: 12);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Consumer',
          textAlign: TextAlign.center,
          style: kTitle2.copyWith(
            color: FarmPortColors.kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        hspacer,
        ValueListenableBuilder(
          valueListenable: isFarmer,
          builder: (context, value, child) => CupertinoSwitch(
              value: isFarmer.value,
              trackColor: FarmPortColors.kBlackColor,
              activeColor: FarmPortColors.kBlackColor,
              onChanged: (val) {
                isFarmer.value = val;
              }),
        ),
        hspacer,
        Text(
          'Farmer',
          textAlign: TextAlign.center,
          style: kTitle2.copyWith(
            color: FarmPortColors.kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  bool authenticate() {
    if (isFarmer.value) {
      if (emailController.text.toLowerCase() != emailFarmer ||
          passwordController.text.toLowerCase() != password) {
        credFail.value = true;
        return false;
      }
    } else {
      if (emailController.text.toLowerCase() != emailConsumer ||
          passwordController.text.toLowerCase() != password) {
        credFail.value = true;
        return false;
      }
    }
    return true;
  }
}
