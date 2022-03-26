import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IllustrationHolder extends StatelessWidget {
  final double height;
  final double width;
  final String illustration;
  final String text;
  const IllustrationHolder(
      {Key? key,
      required this.height,
      required this.width,
      required this.illustration,
      this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            illustration,
            height: height * 0.9,
            width: width * 0.9,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: kTitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
