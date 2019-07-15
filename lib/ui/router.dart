import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/post_view.dart';

const String initialRoute = 'login';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'posts':
        return MaterialPageRoute(builder: (_) => PostView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
