import 'package:farmport_app/ui/utils/constants/app_utils.dart';
import 'package:farmport_app/ui/utils/scroll_config.dart';
import 'package:flutter/material.dart';
import 'package:farmport_app/ui/routes/routes_generator.dart' as router;
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool isAuthenticated;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: appName,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
