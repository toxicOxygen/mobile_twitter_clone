import 'package:flutter/material.dart';
import '../custom_widgets/appbar_icon_widget.dart';
import '../custom_widgets/bottom_navigator.dart';
import './create_tweet_page.dart';
import './tweet_detail_page.dart';
import '../custom_widgets/tweet_card.dart';
import '../custom_widgets/sidebar_widget.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text('Home',style: TextStyle(color: Colors.black),),
        leading: AppBarIconWidget(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: (){},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).pushNamed(CreateTweetPage.tag),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentPageIndex: 0,),
      body: ListView.builder(
        itemBuilder: (ctx,i){
          if(i%3 == 0){
            return TweetCard(
              tweetImages: ['',''],
              onTap: ()=>Navigator.of(context).pushNamed(TweetDetailPage.tag)
            );
          }
          return TweetCard(
            tweetImages: [],
            onTap: ()=>Navigator.of(context).pushNamed(TweetDetailPage.tag)
          );
        },
        itemCount: 15,
      ),
      drawer: Drawer(
        child: SideBarWidget(),
      ),
    );
  }
}
