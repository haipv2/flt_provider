import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flutter/foundation.dart';

import 'login_model.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
