import 'dart:io';

import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PictureWidget extends StatelessWidget {
  final String? logoText;
  final String? networkImage;
  final String? fileImage;

  const PictureWidget(
      {Key? key, this.logoText, this.networkImage, this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = displayHeight(context);
    final width = displayWidth(context);

    return Container(
      height: height * 0.25,
      width: width * 0.7,
      // child: CircleAvatar(
      //     backgroundColor: FarmPortColors.kPrimaryColor,
      //     radius: height * 0.045,
      //     backgroundImage: getImage(),
      //     child: getImage() != null && logoText != null
      //         ? Text(
      //             getTextFirstLetter(logoText!),
      //             style: kTitle1.copyWith(
      //                 fontSize: height * 0.04, color: Colors.white),
      //           )
      //         : const Icon(Icons.camera_alt_outlined, color: Colors.white)),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        image: DecorationImage(image: getImage()),
      ),
    );
  }

  getTextFirstLetter(String text) {
    if (text.length == 1) {
      return text;
    } else {
      return text.trim().toUpperCase()[0];
    }
  }

  ImageProvider<Object> getImage() {
    return (fileImage != null ? FileImage(File(fileImage!)) : null)
        as ImageProvider<Object>;
  }
}
