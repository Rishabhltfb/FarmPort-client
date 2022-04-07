import 'package:farmport_app/data/model/crop.dart';
import 'package:farmport_app/ui/screens/my_crop/component/crop_card.dart';
import 'package:farmport_app/ui/screens/my_crop/crop_screen.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:flutter/material.dart';

class MyCropScreen extends StatefulWidget {
  static const String route = '/my_crop';
  const MyCropScreen({Key? key}) : super(key: key);

  @override
  State<MyCropScreen> createState() => _MyCropScreenState();
}

class _MyCropScreenState extends State<MyCropScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Crops'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            SizedBox(
              height: displayHeight(context) * 0.8,
              child: ListView.builder(
                itemCount: dummyCropList.length,
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) {
                  return CropCard(
                      crop: dummyCropList[index],
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CropScreen(crop: dummyCropList[index])));
                      });
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
