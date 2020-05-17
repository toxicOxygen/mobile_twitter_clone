import 'package:flutter/material.dart';
import '../extras/dummy_data.dart';
import '../custom_widgets/sidebar_widget.dart';
import '../custom_widgets/appbar_icon_widget.dart';
import '../custom_widgets/bottom_navigator.dart';
import '../custom_widgets/search_page_headline_widget.dart';
import './create_tweet_page.dart';
import '../custom_widgets/trending_tweets_widget.dart';


class SearchTweetPage extends StatelessWidget {
  static String tag = 'search-tweet-page';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        leading: AppBarIconWidget(),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical:18.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black12,width: 0.01)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black12,width: 0.01)
              ),
              contentPadding: const EdgeInsets.only(),
              hintText: 'Search Tweet',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.black12,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){},
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentPageIndex: 1,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).pushNamed(CreateTweetPage.tag),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchPageHeadlineWidget(),
            TrendingTweetsWidget(
              trending: trendTags,
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: SideBarWidget(),
      ),
    );
  }
}
