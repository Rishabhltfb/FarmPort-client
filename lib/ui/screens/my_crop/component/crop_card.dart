import 'package:farmport_app/data/model/crop.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CropCard extends StatelessWidget {
  final CropModel crop;
  final Function() onTap;
  const CropCard({Key? key, required this.crop, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    SizedBox spacer = const SizedBox(height: 5);
    BorderRadius borderRadius = const BorderRadius.all(
      Radius.circular(15),
    );
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PhysicalModel(
          color: Colors.transparent,
          borderRadius: borderRadius,
          elevation: 5.0,
          child: Container(
            width: width * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.15,
                  width: width * 0.4,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(crop.image, fit: BoxFit.cover)),
                ),
                spacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        crop.cropName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: kBody2.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        crop.quantity.toString() + ' kg',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: kBody2.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Rs. ' + crop.askingPrice.toString() + ' /kg',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: kBody2.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                spacer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
