import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> push(Function(BuildContext) builder) {
    return navigatorKey.currentState.push(CupertinoPageRoute(builder: builder));
  }

  bool back() {
    return navigatorKey.currentState.pop();
  }
}
