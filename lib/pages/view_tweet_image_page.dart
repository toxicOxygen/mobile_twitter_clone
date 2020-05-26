import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../providers/tweet_provider.dart';
import '../models/posts.dart';

class TweetImageViewPage extends StatelessWidget {
  static String tag = 'tweet-images-view-page';

  @override
  Widget build(BuildContext context) {
    Map<String,int> id = ModalRoute.of(context).settings.arguments;
    Post post = Provider.of<TweetProvider>(
      context,
      listen: false
    ).getPostLocally(id['id']);

    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
          )
        ],
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemBuilder: (ctx,i){
            return Image.network(
              post.images[i].image,
              fit: BoxFit.cover,
            );
          },
          itemCount: post.images.length,
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            enlargeCenterPage: false,
          ),
        ),
      ),
      //TODO split this into a separate widget
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.chat_bubble_outline),
              label: Text('12'),
              textColor: Colors.white,
            ),
            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.refresh),
              label: Text('2'),
              textColor: Colors.white,
            ),
            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.favorite_border),
              label: Text('21'),
              textColor: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.share,color: Colors.white,),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
