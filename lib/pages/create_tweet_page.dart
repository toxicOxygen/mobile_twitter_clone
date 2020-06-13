import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tweet_provider.dart';


class CreateTweetPage extends StatelessWidget {
  static String tag = 'create-tweet-page';
  String _tweet = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)
              ),
              textColor: Colors.white,
              child: Text('Tweet'),
              onPressed: (){},
              color: Colors.blue,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12,right:12,top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 25,
                  minRadius: 20,
                  backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        maxLength: 280,
                        maxLines: 10,
                        minLines: 4,
                        decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          border: InputBorder.none
                        ),
                        onChanged: (val)=>_tweet = val,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.image,
                              color: Colors.blue.withAlpha(180),
                            ),
                            onPressed: (){},
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _createPost(BuildContext context) async{
    final provider = Provider.of<TweetProvider>(context);
    return provider.createPost(_tweet, []).then((value){

    }).catchError((e){
      print(e);
    });
  }
}
