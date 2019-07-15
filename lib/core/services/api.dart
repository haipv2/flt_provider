import 'dart:convert';
import 'package:flt_provider/core/models/comment.dart';
import 'package:flt_provider/core/models/post.dart';
import 'package:flt_provider/core/models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    //get user by id
    var response = await client.get('$endpoint/users/$userId');

    // convert to user
    var user = User.fromJson(json.decode(response.body));
    return user;
  }

   Future<List<Post>> getPostForUser(int userId) async {
    var posts = List<Post>();

    //get user posts
     var resposne = await client.get('$endpoint/posts?userId=$userId');

     //parse into List
     var parsed = json.decode(resposne.body) as List<dynamic>;

     // loop and convert each itme to Post
     for (var post in parsed) {
       posts.add(Post.fromJson(post));
     }
     return posts;
   }

  Future<List<Comment>> getCommentsForPost(int postId) async{
    var comments = List<Comment>();

    //get comments
    var response = await client.get('$endpoint/comments?postId=$postId');

    var parsed = json.decode(response.body) as List<dynamic>;

    //loop and convert comment
    for (var comment in parsed){
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
}
