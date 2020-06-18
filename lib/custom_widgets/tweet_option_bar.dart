import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/providers/tweet_provider.dart';
import '../pages/add_comment_page.dart';
import './custom_bottom_sheet.dart';

class TweetOptionsBar extends StatelessWidget {
  final int postId;
  const TweetOptionsBar({
    Key key,
    this.postId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tweetProvider = Provider.of<TweetProvider>(context,listen: true);
    final post = tweetProvider.getPostLocally(postId);
    
    final List<int> likesCount = post.post.usersLike?? [];
    final commentsCount = post.post.comments?? [];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomIconButton(
          count: commentsCount.length,
          icon: Icon(Icons.chat_bubble_outline),
          onPressed: (){
            Navigator.of(context).pushNamed(AddCommentPage.tag,arguments: postId);
          },
        ),
        CustomIconButton(
          count: 0,
          icon: Icon(Icons.refresh),
          onPressed: (){
            Scaffold.of(context).showBodyScrim(true, 0.3);
            Scaffold.of(context).showBottomSheet((context)=>BottomSheet(
              builder: (ctx)=>CustomBottomSheet(),
              onClosing: (){},
            ));
          },
        ),
        CustomIconButton(
          count: likesCount.length,
          icon: Icon(Icons.favorite_border),
          onPressed: (){},
        ),
      ],
    );
  }
}



class CustomIconButton extends StatelessWidget {

  final Icon icon;
  final VoidCallback onPressed;
  final int count;

  CustomIconButton({
    this.count = 0,
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      textColor: Colors.black54,
      icon: icon,
      label: Text('$count'),
      onPressed: onPressed,
    );
  }
}