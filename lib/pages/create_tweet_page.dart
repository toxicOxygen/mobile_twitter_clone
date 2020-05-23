import 'package:flutter/material.dart';

class CreateTweetPage extends StatelessWidget {
  static String tag = 'create-tweet-page';

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      TextField(
                        maxLength: 280,
                        maxLines: 10,
                        minLines: 4,
                        decoration: InputDecoration(
                            hintText: "What's on your mind?",
                            border: InputBorder.none
                        ),
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
}
