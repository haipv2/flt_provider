import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flt_provider/core/models/comment.dart';
import 'package:flt_provider/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';
import 'login_model.dart';

class CommentsModel extends BaseModel{
  Api _api = locator<Api>();
  List<Comment> comments;
  Future fetchComments(int postId) async{
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);

  }
}