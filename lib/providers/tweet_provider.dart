import 'package:flutter/material.dart';
import '../extras/exceptions.dart';
import '../models/posts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TweetProvider extends ChangeNotifier{

  String _baseUrl = "https://kwaku96.pythonanywhere.com";

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  List<Post> _posts = [];

  List<Post> get posts{
    return _posts;
  }

  Post getPostLocally(int id){
    return _posts.firstWhere((element) => element.id == id);
  }

  Future<List<Post>> getPosts() async{
    var url = "$_baseUrl/api/v1/posts/";

    return _getToken().then((value){
      _posts.clear();
      return http.get(
        url,
        headers: {
          "Content-Type":"application/json",
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
        _posts.add(Post.fromJson(item));
      }
      notifyListeners();
      return _posts;
    }).then((value){
      return value;
    }).catchError((e){
      print(e);
      return e;
    });
  }

  Future<void> createPost(String tweet,String images) async{
    var url = '$_baseUrl/api/v1/posts/';
    return _getToken().then((value){
      return http.post(
        url,
        headers: {
          "Content-Type":"application/json",
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