import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
import './pages/login_page.dart';
import './pages/signup_page.dart';
import './pages/home_page.dart';
import './pages/tweet_detail_page.dart';
import './pages/add_comment_page.dart';
import './pages/create_tweet_page.dart';
import './pages/profile_page.dart';
import './pages/search_page.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: WelcomePage(),
      routes: {
        WelcomePage.tag : (context)=> WelcomePage(),
        LoginPage.tag : (context)=> LoginPage(),
        SignUpPage.tag : (context)=> SignUpPage(),
        HomePage.tag : (context)=>HomePage(),
        TweetDetailPage.tag : (context)=> TweetDetailPage(),
        AddCommentPage.tag : (context)=> AddCommentPage(),
        CreateTweetPage.tag : (context)=> CreateTweetPage(),
        ProfilePage.tag : (context)=> ProfilePage(),
        SearchTweetPage.tag : (context)=> SearchTweetPage()
      },
    );
  }
}
