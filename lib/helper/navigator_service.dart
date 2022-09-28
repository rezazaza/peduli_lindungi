import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithArgmnt(String routeName, dynamic obj) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: obj);
  }

  Future<dynamic> navigateReplaceTo(String routeName, {dynamic obj}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: obj);
  }
  // Future<dynamic> navigateReplaceTo(String routeName, {dynamic obj}) {
  //   return navigatorKey.currentState!
  //       .pushAndRemoveUntil(routeName,true);
  // }

  void goBack([dynamic value]) {
    return navigatorKey.currentState!.pop(value);
  }
}
