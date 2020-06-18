import 'package:flutter/material.dart';
import '../extras/exceptions.dart';
import '../models/posts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Tweet extends ChangeNotifier{
  String _baseUrl = "https://kwaku96.pythonanywhere.com";
  Post post;

  Tweet({
    @required this.post
  });

  Tweet.fromJson(Map<String,dynamic> json){
    post = Post.fromJson(json);
  }

  Future<void> toggleLike(String token) async{
    var url = "$_baseUrl/api/v1/posts/like_post/";
    return http.post(
      url,
      headers: {
        "Authorization":"Token $token",
        "Content-Type":"application/json",
      },
      body: {
        "id":post.id,
        "action":"like" //TODO change this later
      }
    ).then((value){
      if(value.statusCode != 200)
        throw HttpException('failed to like post');
      return json.decode(value.body);
    }).then((value){
      if(value['status'] == "ko")
        throw HttpException("failed to perform action");
      print(value);
    }).catchError((e){
      print(e);
      throw HttpException(e.toString());
    });
  }
}


class TweetProvider extends ChangeNotifier{

  String _baseUrl = "https://kwaku96.pythonanywhere.com";

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  List<Tweet> _posts = [];

  List<Tweet> get posts{
    return [..._posts];
  }

  Tweet getPostLocally(int id){
    return _posts.firstWhere((element) => element.post.id == id);
  }

  Future<void> getPosts() async{
    var url = "$_baseUrl/api/v1/posts/";

    return _getToken().then((value){
      _posts.clear();
      return http.get(
        url,
        headers: {
          "Authorization":"Token $value"
        }
      );
    }).then((value){
      var res = json.decode(value.body);
      if(value.statusCode != 200)
        throw HttpException(res['detail']);
      return json.decode(value.body);
    }).then((value){
      for(var item in value){
        _posts.add(Tweet.fromJson(item));
      }
      notifyListeners();
    }).catchError((e){
      print(e);
      throw HttpException(e.toString());
    });
  }

  Future<void> createPost(String tweet,String images) async{
    var url = '$_baseUrl/api/v1/posts/';
    
    return _getToken().then((value){
      return http.post(
        url,
        headers: {
          'Authorization':'Token $value'
        },
        body: {
          'tweet':tweet,
          'file': images
        }
      );
    }).then((value){
      if(value.statusCode != 201)
        throw HttpException("failed to add post");
      return json.decode(value.body);
    }).then((value){
      _posts.insert(0, Tweet.fromJson(value));
      notifyListeners();
    }).catchError((e){
      throw HttpException(e.toString());
    });
  }

  Future<String> _getToken() async{
    SharedPreferences prefs = await _pref;
    String token = prefs.get('token');
    if(token == null)
      throw HttpException('failed to get token');
    return token;
  }

  Future<Post> getPost(String id) async{
    var url = "$_baseUrl/api/v1/posts/$id";
    return _getToken().then((value){
      return value;
    }).then((value){
      return http.get(url);
    }).then((value){
      if(value.statusCode != 200)
        throw HttpException("Post was not retrieved");
      return json.decode(value.body);
    }).then((value){
      return Post.fromJson(value);
    }).catchError((e){
      throw HttpException(e.toString());
    });
  }

}