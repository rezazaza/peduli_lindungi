import 'package:clone_peduli_lindungi/helper/locator.dart';
import 'package:clone_peduli_lindungi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helper/navigator_service.dart';
import 'helper/route_generator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(800, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Clone Peduli Lindungi',
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'OpenSans'),
          navigatorKey: locator<NavigatorService>().navigatorKey,
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        );
      },
    );
  }
}
