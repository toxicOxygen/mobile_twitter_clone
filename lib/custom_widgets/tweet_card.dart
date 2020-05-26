import 'package:flutter/material.dart';
import '../models/images.dart';
import './images_grid_widget.dart';

class TweetCard extends StatelessWidget {
  final String userProfileImageUrl;
  final String tweet;
  final List<PostImage> tweetImages;
  final int postId;
  final VoidCallback onTap;

  TweetCard({
    this.userProfileImageUrl,
    this.tweetImages = const [],
    this.onTap,
    @required this.postId,
    this.tweet = "Yo I'm on the phone with infinity ward.",
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12)
        )
      ),
      padding: const EdgeInsets.only(top: 8),
      constraints: BoxConstraints(
        maxHeight: height * 0.45,
        minHeight: height * 0.15,
        maxWidth: width
      ),
      child: Card(
        elevation: 0.0,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  minRadius: 20,
                  maxRadius: 25,
                  backgroundImage: NetworkImage('https://tinyurl.com/yawxco2g'),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Seth Huntsmen ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                              text: '@bk_windfred',
                              style: TextStyle(color: Colors.black45)
                            )
                          ]
                        ),
                      ),
                      Text(
                        "$tweet",
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 5,),
                      tweetImages.isEmpty? Container(height: 0.001,):
                      ImagesGridWidget(
                        images: tweetImages,
                        height: height * .23,
                        postId: postId,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.chat_bubble_outline),
                            label: Text('12'),
                            textColor: Colors.black54,
                          ),
                          FlatButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.refresh),
                            label: Text('2'),
                            textColor: Colors.black54,
                          ),
                          FlatButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.favorite_border),
                            label: Text('21'),
                            textColor: Colors.black54,
                          ),
                          IconButton(
                            icon: Icon(Icons.share,color: Colors.black54,),
                            onPressed: (){},
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
