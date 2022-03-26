import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final Color color;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isPassword = false,
    this.color = FarmPortColors.kWhiteColor,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: 1,
      obscureText: isPassword,
      style: TextStyle(
        color: color,
      ),
      cursorColor: color,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          labelText: labelText,
          labelStyle: kBody1.copyWith(color: color),
          hintText: hintText,
          hintStyle: kBody1.copyWith(color: color),
          fillColor: color),
    );
  }
}
