import 'package:farmport_app/ui/common/illustration_holder.dart';
import 'package:farmport_app/ui/screens/crops_upload/crops_upload.dart';
import 'package:farmport_app/ui/utils/constants/assets.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    SizedBox spacer = const SizedBox(height: 16);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            IllustrationHolder(
                height: height * 0.4,
                width: width * 0.6,
                illustration: FarmPortAssets.farmer,
                text: 'Welcome Farmer'),
            SizedBox(height: height * 0.15),
            SizedBox(
              width: width * 0.5,
              height: 50,
              child: OutlinedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CropsUpload.route),
                child: const Text('Upload Crop', style: kBody2),
              ),
            ),
            spacer,
            SizedBox(
              width: width * 0.5,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('View Crop', style: kBody2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
