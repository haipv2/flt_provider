import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flt_provider/login_page.dart';
import 'user_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => UserRepository.instance(),
      child: Consumer(builder: (context, UserRepository user, _){
        switch (user.status){
          case Status.Uninitialized:
            return Splash();
          case Status.Unauthenticated:
          case Status.Authenticating:
            return LoginPage();
          case Status.Authenticated:
            return UserInfoPage(user: user.user);
        }
      }),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final FirebaseUser user;

  const UserInfoPage({Key key, this.user}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            RaisedButton(
              child: Text('SIGN_OUT'),
              onPressed: ()=> Provider.of<UserRepository>(context).signOut(),
            )
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('Splash screen'),
      ),
    );
  }
}



