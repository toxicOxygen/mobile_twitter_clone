import 'package:flutter/material.dart';
import 'package:twitter_clone/custom_widgets/tweet_card.dart';
import './add_comment_page.dart';
import '../custom_widgets/tweet_detail_widget.dart';
import '../models/posts.dart';

class TweetDetailPage extends StatelessWidget {
  static String tag = 'tweet-detail-page';

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> t = ModalRoute.of(context).settings.arguments;
    Post post = t['post'];

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
        onPressed: ()=>Navigator.of(context).pushNamed(AddCommentPage.tag,arguments: post.id),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i){
          if(i == 0){
            return TweetDetailWidget(
              tweet: post.tweet,
              images: post.images,
              postId: post.id,
            );
          }
          //TODO replace id with tweet id
          return TweetCard(
            postId: 1,
            tweet: post.comments[i-1].comment,
          );
        },
        itemCount: post.comments.length + 1,
      ),
    );
  }
}
