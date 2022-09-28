import 'package:clone_peduli_lindungi/helper/constants.dart';
import 'package:clone_peduli_lindungi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        // return MaterialPageRoute(builder: (_) => const HomeScreen());
        return _pageBuilderSlidetTrasision(child: const HomeScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        // appBar: simpleHeader('Error'),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ups, ada sesuatu yang salah. Coba lagi"),
            Container(
              margin: EdgeInsets.all(6.w),
            ),
            GestureDetector(onTap: () {}, child: const Icon(Icons.replay))
          ],
        )),
      );
    });
  }

  static Route<dynamic> _pageBuilderSlidetTrasision({required Widget child}) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return child;
      },
      transitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (c, anim, a2, child) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim),
        );
      },
    );
  }
}
