import 'package:farmport_app/ui/screens/auth/auth_screen.dart';
import 'package:farmport_app/ui/screens/onboarding/onboading_screen.dart';
import 'package:farmport_app/ui/utils/constants/assets.dart';
import 'package:farmport_app/ui/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(AuthScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset(FarmPortAssets.farmLottie, repeat: true),
          ),
        ),
      ),
    );
  }
}
