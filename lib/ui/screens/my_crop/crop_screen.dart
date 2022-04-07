import 'package:farmport_app/data/model/crop.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:farmport_app/ui/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CropScreen extends StatefulWidget {
  final CropModel crop;
  const CropScreen({Key? key, required this.crop}) : super(key: key);

  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  ValueNotifier<bool> isFav = ValueNotifier(false);
  late String userId = '';
  String cropAbout =
      '\n\n Bid 1: Rs. 51 /kg \n Bid 2: Rs. 53 /kg \n Bid 3: Rs. 52 /kg\n Bid 4: Rs. 57 /kg\n Bid 5: Rs. 53.5 /kg\n Bid 6: Rs. 53.2 /kg\n';

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          child: Stack(
            children: [
              bgImage(height * 0.45, width, widget.crop.image),
              mask(height * 0.45, width),
              Positioned(
                  bottom: 0, child: detailCard(widget.crop, height, width)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                    ValueListenableBuilder(
                      valueListenable: isFav,
                      builder: (context, value, child) => IconButton(
                          onPressed: () {
                            isFav.value = !isFav.value;
                          },
                          icon: Icon(
                              isFav.value
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mask(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget bgImage(double height, double width, String image) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Container detailCard(CropModel crop, double height, double width) {
    List<Map<String, String>> cussineImagesList = cussineList;
    SizedBox spacer = const SizedBox(height: 16);
    return Container(
      height: height * 0.65,
      width: width,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(crop.cropName + '   ' + crop.quantity.toString() + ' kg',
                style: kTitle1.copyWith(fontWeight: FontWeight.bold)),
            Text('Rs.' + crop.askingPrice.toString() + ' /kg', style: kBody1),
            spacer,
            Text(crop.cropName + cropAbout,
                textAlign: TextAlign.justify,
                style: kBody1.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                )),
            spacer,
            Text(
              'Other crops',
              style: kBody1.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: width * 0.42,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cussineImagesList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          color: Colors.transparent,
                          elevation: 4,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.asset(
                                  cussineImagesList[index]['url'] ?? '',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        cussineImagesList[index]['name'] ?? '',
                        style: kBody2,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
