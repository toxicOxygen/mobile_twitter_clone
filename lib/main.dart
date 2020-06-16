import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_providers.dart';
import './providers/tweet_provider.dart';
import './pages/welcome_page.dart';
import './pages/login_page.dart';
import './pages/signup_page.dart';
import './pages/home_page.dart';
import './pages/tweet_detail_page.dart';
import './pages/add_comment_page.dart';
import './pages/create_tweet_page.dart';
import './pages/profile_page.dart';
import './pages/notifications_page.dart';
import './pages/search_page.dart';
import './pages/messages_page.dart';
import './pages/splash_page.dart';
import './pages/view_tweet_image_page.dart';
import './providers/user_provider.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Consumer<AuthProvider>(
        builder: (ctx,auth,_)=> MaterialApp(
          title: 'Twitter Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          home: auth.isAuthenticated ? HomePage() : FutureBuilder(
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
            HomePage.tag : (context)=>HomePage(),
            TweetDetailPage.tag : (context)=> TweetDetailPage(),
            AddCommentPage.tag : (context)=> AddCommentPage(),
            CreateTweetPage.tag : (context)=> CreateTweetPage(),
            ProfilePage.tag : (context)=> ProfilePage(),
            SearchTweetPage.tag : (context)=> SearchTweetPage(),
            NotificationsPage.tag : (context)=> NotificationsPage(),
            MessagesPage.tag : (context) => MessagesPage(),
            TweetImageViewPage.tag : (context)=> TweetImageViewPage()
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
