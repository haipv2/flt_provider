import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flt_provider/core/viewmodels/login_model.dart';
import 'package:flt_provider/ui/shared/app_colors.dart';
import 'package:flt_provider/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(
                  controller: _controller,
                  validationMessage: model.errorMessage,
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      )
              ],
            ),
          ),
    );
  }
}
