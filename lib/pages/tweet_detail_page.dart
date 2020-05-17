import 'package:flutter/material.dart';
import 'package:twitter_clone/custom_widgets/tweet_card.dart';
import './add_comment_page.dart';
import '../custom_widgets/tweet_detail_widget.dart';

class TweetDetailPage extends StatelessWidget {
  static String tag = 'tweet-detail-page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tweet',style: TextStyle(color: Colors.black),),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat_bubble_outline),
        onPressed: ()=>Navigator.of(context).pushNamed(AddCommentPage.tag),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i){
          if(i == 0){
            return TweetDetailWidget();
          }
          return TweetCard(tweetImages: [],);
        },
        itemCount: 9,
      ),
    );
  }
}