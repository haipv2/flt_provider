import 'package:flt_provider/core/enums/view_state.dart';
import 'package:flt_provider/core/models/post.dart';
import 'package:flt_provider/core/models/user.dart';
import 'package:flt_provider/core/viewmodels/home_model.dart';
import 'package:flt_provider/ui/shared/app_colors.dart';
import 'package:flt_provider/ui/shared/text_styles.dart';
import 'package:flt_provider/ui/shared/ui_helper.dart';
import 'package:flt_provider/ui/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: model.state == ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UIHelper.verticalSpaceLarge(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Welcome ${Provider.of<User>(context).name}',
                          style: headerStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Here all posts',
                          style: subHeaderStyle,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Expanded(child: getPostsUi(model.posts))
                    ],
                  )));
  }

  Widget getPostsUi(List<Post> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
              post: posts[index],
              onTap: () {
                Navigator.pushNamed(context, '/post', arguments: posts[index]);
              },
            ));
  }
}