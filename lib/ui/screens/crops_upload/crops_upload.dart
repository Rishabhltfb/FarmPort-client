import 'dart:developer';

import 'package:farmport_app/data/model/crop.dart';
import 'package:farmport_app/ui/common/custom_text_field.dart';
import 'package:farmport_app/ui/common/illustration_holder.dart';
import 'package:farmport_app/ui/common/picture_widget.dart';
import 'package:farmport_app/ui/common/show_img_picker_sheet.dart';
import 'package:farmport_app/ui/utils/constants/assets.dart';
import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CropsUpload extends StatefulWidget {
  static const String route = '/upload';
  const CropsUpload({Key? key}) : super(key: key);

  @override
  State<CropsUpload> createState() => _CropsUploadState();
}

class _CropsUploadState extends State<CropsUpload> {
  late double height, width;
  CropModel newCrop = CropModel.empty();
  TextEditingController cropName = TextEditingController();
  ValueNotifier<double> askingPrice = ValueNotifier(25.0);
  ValueNotifier<double> quantity = ValueNotifier(1.0);
  final ValueNotifier<XFile?> pickedImageFile = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    height = displayHeight(context);
    width = displayWidth(context);
    SizedBox spacer = const SizedBox(height: 12);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              IllustrationHolder(
                  height: height * 0.39,
                  width: width * 0.55,
                  illustration: FarmPortAssets.upload,
                  text: 'Add Crop Data'),
              spacer,
              SizedBox(
                width: width * 0.7,
                child: CustomTextField(
                  textEditingController: cropName,
                  hintText: 'Type the crop name here...',
                  labelText: 'Crop Name',
                  color: FarmPortColors.kBlackColor,
                ),
              ),
              spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Asking Price(per kg):', style: kBody2),
                  ValueListenableBuilder(
                    valueListenable: askingPrice,
                    builder: (context, value, _) => Slider(
                        value: askingPrice.value,
                        divisions: 10,
                        min: 20,
                        max: 1000,
                        label: askingPrice.value.toString(),
                        onChanged: (val) {
                          askingPrice.value = val;
                        }),
                  ),
                ],
              ),
              spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Quantity(in kg):', style: kBody2),
                  ValueListenableBuilder(
                    valueListenable: quantity,
                    builder: (context, value, _) => Slider(
                        value: quantity.value,
                        divisions: 10,
                        min: 1,
                        max: 1000,
                        label: quantity.value.toString(),
                        onChanged: (val) {
                          quantity.value = val;
                        }),
                  ),
                ],
              ),
              spacer,
              ValueListenableBuilder(
                  valueListenable: pickedImageFile,
                  builder: (context, value, child) =>
                      pickedImageFile.value == null
                          ? GestureDetector(
                              onTap: () {
                                log('Add Image');
                                showImagePickerSheet(context, pickedImageFile);
                              },
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                    FarmPortAssets.img,
                                    height: height * 0.25,
                                    width: width * 0.6,
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: FarmPortColors
                                            .kGreyColor
                                            .withOpacity(0.2),
                                        child: const Icon(Icons.add,
                                            size: 60,
                                            color: FarmPortColors.kWhiteColor),
                                      )),
                                ],
                              ),
                            )
                          : PictureWidget(
                              fileImage: pickedImageFile.value!.path,
                            )),
              spacer,
              spacer,
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          FarmPortColors.kBlackColor)),
                  child: Text(
                    'Submit Crop',
                    style: kBody2.copyWith(
                        color: FarmPortColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
