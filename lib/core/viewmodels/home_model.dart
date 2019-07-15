

import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flt_provider/core/models/post.dart';
import 'package:flt_provider/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';
import 'login_model.dart';

class HomeModel extends BaseModel{
  Api _api = locator<Api>();
  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostForUser(userId);
    setState(ViewState.Idle);
  }
}