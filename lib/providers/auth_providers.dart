import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/extras/exceptions.dart';


class AuthProvider extends ChangeNotifier{
  String _token;
  String _userId;
  String _baseUrl = 'http://kwaku96.pythonanywhere.com';

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool get isAuthenticated{
    return token != null;
  }

  String get token => _token == null ? null : _token;

  String get userId => _userId;

  Future<void> signUp(String email,String username, String password){
    String url = '$_baseUrl/api/v1/rest-auth/registration/';

    return http.post(url,body: {
      'email':email,
      'username':username,
      'password1':password,
      'password2':password
    }).then((value){
      if(value.statusCode != 200)
        throw HttpException('Login failed');
      return json.decode(value.body);
    }).then((value) async{
      if(value['key'] == null)
        throw HttpException('sign up failed');
      SharedPreferences prefs = await _prefs;
      prefs.setString('token', value['key']);
      return value['key'];
    }).catchError((e){
      print(e);
    });
  }

  Future<void> login(String email,String username,String password){
    String url = '$_baseUrl/api/v1/rest-auth/login/';
    return http.post(url,body: {
      'email':email,
      'username':username,
      'password':password,
    }).then((value){
      return json.decode(value.body);
    }).then((value) async{
      if(value['key'] == null){
        throw HttpException('authenication failed, try again later');
      }
      final key = value['key'];
      SharedPreferences prefs = await _prefs;
      prefs.setString('token', key);
      return key;
    }).then((value){
      notifyListeners();
    }).catchError((e){
      print(e);
      return e;
    });
  }

  Future<bool> logout(){
    String url = '$_baseUrl/api/v1/rest-auth/logout/';
    return http.post(url)
        .then((value)=> json.decode(value.body))
        .then((value) async{
          final SharedPreferences prefs = await _prefs;
          return prefs.clear();
        }).then((value){
          return value;
        }).catchError((e)=>print(e));
  }

  Future<bool> tryAutoLogin() async{
    final SharedPreferences prefs = await _prefs;
    final bool hasToken = prefs.containsKey('token');

    if(hasToken){
      _token = prefs.get('token');
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> getCurrentUserDetail(){
    final url = '$_baseUrl/api/v1/users/current_user/';
    final headers = {
      'Authorization':token,
    };
    return http.get(url,headers: headers).then((value){
      return json.decode(value.body);
    }).then((value){
      print(value);
    }).catchError((error){
      print(error);
    });
  }

}