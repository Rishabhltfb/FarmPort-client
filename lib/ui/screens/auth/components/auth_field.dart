import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final bool isPassword;
  const AuthField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isPassword = false,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: 1,
      obscureText: isPassword,
      style: const TextStyle(
        color: FarmPortColors.kWhiteColor,
      ),
      cursorColor: FarmPortColors.kWhiteColor,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: FarmPortColors.kWhiteColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: FarmPortColors.kWhiteColor),
          ),
          labelText: labelText,
          labelStyle: kBody1.copyWith(color: FarmPortColors.kWhiteColor),
          hintText: hintText,
          hintStyle: kBody1.copyWith(color: FarmPortColors.kWhiteColor),
          fillColor: FarmPortColors.kWhiteColor),
    );
  }
}
