import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_providers.dart';
import './providers/tweet_provider.dart';
import './pages/welcome_page.dart';
import './pages/login_page.dart';
import './pages/signup_page.dart';
import './pages/tweet_detail_page.dart';
import './pages/add_comment_page.dart';
import './pages/create_tweet_page.dart';
import './pages/profile_page.dart';
import './pages/splash_page.dart';
import './pages/view_tweet_image_page.dart';
import './providers/user_provider.dart';
import './pages/edit_profile_page.dart';
import './pages/root_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Consumer<AuthProvider>(
          builder: (ctx,auth,_)=> MaterialApp(
            title: 'Twitter Clone',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  color: Colors.white,
                  iconTheme: IconThemeData(color: Colors.blue),
                )
            ),
            home: auth.isAuthenticated ? RootScreen() : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (ctx,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return SplashPage();
                return WelcomePage();
              },
            ),
            routes: {
              WelcomePage.tag : (context)=> WelcomePage(),
              LoginPage.tag : (context)=> LoginPage(),
              SignUpPage.tag : (context)=> SignUpPage(),
              TweetDetailPage.tag : (context)=> TweetDetailPage(),
              AddCommentPage.tag : (context)=> AddCommentPage(),
              CreateTweetPage.tag : (context)=> CreateTweetPage(),
              ProfilePage.tag : (context)=> ProfilePage(),
              TweetImageViewPage.tag : (context)=> TweetImageViewPage(),
              EditProfilePage.tag : (context)=> EditProfilePage(),
              RootScreen.tag : (context)=>RootScreen()
            },
          )
      ),
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: TweetProvider()),
        ChangeNotifierProvider.value(value: UserProvider())
      ],
    );
  }
}
