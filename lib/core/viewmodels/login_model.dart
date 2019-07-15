import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flt_provider/core/services/aut_service.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';
import 'base_model.dart';


class LoginModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async{
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    // not a number
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    // handle potential error here
    setState(ViewState.Idle);
    return success;
  }


}
