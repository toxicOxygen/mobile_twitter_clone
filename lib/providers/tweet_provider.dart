import 'package:flutter/material.dart';
import '../extras/exceptions.dart';
import '../models/posts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TweetProvider extends ChangeNotifier{
  final String _baseUrl = 'http://kwaku96.pythonanywhere.com';

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  List<Post> _posts = [];

  List<Post> get posts{
    return _posts;
  }

  Future<List<Post>> getPosts() async{
    var url = "$_baseUrl/api/v1/posts/";

    return _getToken().then((value){
      _posts.clear();
      return http.get(
          url,
          headers: {"Authorization":value}
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

  Future<void> createPost(String tweet,List<FileImage> images) async{
    var url = '$_baseUrl/api/v1/posts/';
    return _getToken().then((value){
      return http.post(
        url,
        headers: {"Authorization":value},
        body: {'user':1,'tweet':tweet,'file':images}
      );
    }).then((value){
      if(value.statusCode != 201)
        throw HttpException('Failed to create post');

    }).catchError((e){

    });
  }

  Future<String> _getToken() async{
    SharedPreferences prefs = await _pref;
    String token = prefs.get('token');
    if(token == null)
      throw HttpException('failed to get token');
    return token;
  }
}