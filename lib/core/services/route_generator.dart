import 'package:delivery/view/auth/screen/signup_phone_page.dart';
import 'package:delivery/view/home/screen/home_page.dart';
import 'package:flutter/material.dart';

import '../../view/auth/screen/complete_info_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpPage.routeName:
        return buildPage(SignUpPage());
      case CompleteInfoPage.routeName:
        return buildPage(CompleteInfoPage());
      case HomeLayoutPage.routeName:
        return buildPage(HomeLayoutPage());
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error Screen'),
        ),
        body: const Center(
          child: Text('somthing went wrong!'),
        ),
      );
    });
  }

  MaterialPageRoute buildPage(widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
