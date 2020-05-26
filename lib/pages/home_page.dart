import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_widgets/appbar_icon_widget.dart';
import '../custom_widgets/bottom_navigator.dart';
import './create_tweet_page.dart';
import './tweet_detail_page.dart';
import '../custom_widgets/tweet_card.dart';
import '../custom_widgets/sidebar_widget.dart';
import '../providers/tweet_provider.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() { _isLoading = true; });
      Provider.of<TweetProvider>(context).getPosts()
      .then((_){
        setState(() {_isLoading = false; });
      }).catchError((e){
        setState(() {_isLoading = false; });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TweetProvider>(
      builder: (ctx,tweetProvider,_){
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
          body: _isLoading ?
            Center(child: CircularProgressIndicator(),) :
            ListView.builder(
            itemBuilder: (ctx,i){
              return TweetCard(
                  tweet: tweetProvider.posts[i].tweet,
                  tweetImages: tweetProvider.posts[i].images,
                  onTap: ()=>Navigator.of(context).pushNamed(
                      TweetDetailPage.tag,
                      arguments: {'post':tweetProvider.posts[i]}
                  )
              );
            },
            itemCount: tweetProvider.posts.length,
          ),
          drawer: Drawer(
            child: SideBarWidget(),
          ),
        );
      },
    );
  }
}
