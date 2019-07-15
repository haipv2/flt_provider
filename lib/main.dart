import 'package:flt_provider/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/services/aut_service.dart';
import 'locator.dart';
import 'ui/router.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'flutter demo',
        theme: ThemeData(),
        initialRoute: initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
