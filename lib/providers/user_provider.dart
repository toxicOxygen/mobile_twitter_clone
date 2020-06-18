import 'dart:convert';

import 'package:flutter/material.dart';
import '../extras/exceptions.dart';
import '../models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier{
  final String _baseUrl = "https://kwaku96.pythonanywhere.com";
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List<User> _users = [];
  User _currentUser;

  List<User> get users => _users;
  User get currentUser => _currentUser;

  Future<void> fetchAllUser() async{
    var url = "$_baseUrl/api/v1/users/";
    return _getToken().then((value){
      return value;
    }).then((value){
      return http.get(
        url,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Token $value"
        }
      );
    }).then((value){
      if(value.statusCode != 200 )
        throw HttpException('failed to fetched data');
      return json.decode(value.body);
    }).then((value){
        for(var user in value){
          _users.add(User.fromJson(user));
        }
        notifyListeners();
    }).catchError((e){
      print(e);
      throw HttpException(e);
    });
  }

  Future<void> fetchCurrentUser() async {
    print("calling fetch user....");
    var url = "$_baseUrl/api/v1/users/current_user/";
    return _getToken().then((value){
      return value;
    }).then((value){
      return http.get(
        url,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Token $value"
        }
      );
    }).then((value){
      if(value.statusCode != 200)
        throw HttpException("failed to get current user");
      return json.decode(value.body);
    }).then((value) async{
      User user = User.fromJson(value);
      _currentUser = user;
      notifyListeners();
    }).catchError((e){
      print(e);
      throw HttpException(e.toString());
    });
  }

  Future<User> fetchSingleUser(int id) async{
    var url = "$_baseUrl/api/v1/users/$id/";
    return _getToken().then((value){
      return value;
    }).then((value){
      return http.get(
        url,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Token $value"
        }
      );
    }).then((value){
      if(value.statusCode != 200)
        throw HttpException("failed to get current user");
      return json.decode(value.body);
    }).then((value) async{
      User user = User.fromJson(value);
      return user;
    }).catchError((e){
      print(e);
      throw HttpException(e.toString());
    });
  }

  Future<void> followUser(int targetUser,String action) async{
    var url = "$_baseUrl/api/v1/users/follow/";
    return _getToken().then((value){
      return value;
    }).then((value){
      return http.post(
        url,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Token $value"
        },
        body: {
          "id":targetUser,
          "action":action
        }
      );
    }).then((value){
      if(value.statusCode != 200)
        throw HttpException('failed to follow');
      return json.decode(value.body);
    }).then((value){
      if(value['status'] !="ok")
        throw HttpException('failed to follow');
    }).catchError((e){
      print(e);
      throw HttpException(e.toString());
    });
  }

  Future<String> _getToken() async{
    SharedPreferences prefs = await _pref;
    String token = prefs.get('token');
    if(token == null)
      throw HttpException('could not fetch key');
    return token;
  }
  
}
