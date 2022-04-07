import 'package:flutter/material.dart';

class CropMarketScreen extends StatefulWidget {
  static const String route = '/market';
  const CropMarketScreen({Key? key}) : super(key: key);

  @override
  State<CropMarketScreen> createState() => _CropMarketScreenState();
}

class _CropMarketScreenState extends State<CropMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Center(
            child: Column(
              children: const [],
            ),
          ),
          Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new)))
        ],
      )),
    );
  }
}
