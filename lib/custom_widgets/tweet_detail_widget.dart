import 'package:flutter/material.dart';
import '../models/images.dart';
import './images_grid_widget.dart';
import '../models/posts.dart';

class TweetDetailWidget extends StatelessWidget {

  final Post post;

  TweetDetailWidget({
    this.post
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            minRadius: 20,
            maxRadius: 25,
            backgroundImage: NetworkImage('https://tinyurl.com/yawxco2g'),
          ),
          title: Text(
            post.user.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('@bk_${post.user.username}'),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: (){},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            post.tweet,
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.black87
            ),
          ),
        ),
        if(post.images.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: ImagesGridWidget(
              height: height * .3,
              images: post.images,
              postId: post.id,
            ),
          ),
        Container(
          padding: const EdgeInsets.only(left: 13),
          width: double.infinity,
          child: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black38),
                children: [
                  TextSpan(text: '3:35 PM  MAY 16,2020  '),
                  TextSpan(
                      text: 'Twitter for android',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                  )
                ]
            ),
          ),
        ),
        Divider(indent: 13,endIndent: 13, height: 20,),
        Row(
          children: <Widget>[
            SizedBox(width: 13,),
            RichText(
              text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  text: '349',
                  children: [
                    TextSpan(
                        text: ' Retweets',
                        style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54)
                    )
                  ]
              ),
            ),
            SizedBox(width: 13,),
            RichText(
              text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  text: '34K',
                  children: [
                    TextSpan(
                        text: ' likes',
                        style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54)
                    )
                  ]
              ),
            )
          ],
        ),
        Divider(indent: 13,endIndent: 13, height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat_bubble_outline,color: Colors.black54,),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.settings_backup_restore,color: Colors.black54,),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border,color: Colors.black54,),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.share,color: Colors.black54,),
              onPressed: (){},
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
