import 'package:flutter/material.dart';

class AddCommentPage extends StatelessWidget {
  static String tag = 'add-comment-page';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
              child: Text('Comment'),
              onPressed: (){},
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: height * 0.3,
              minHeight: height * .15
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 25,
                        backgroundImage: NetworkImage('https://tinyurl.com/yawxco2g'),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                              text: 'Virgil van Dijk ',
                              children: [
                                TextSpan(
                                  text: '@VirgilvDijk   16h',
                                  style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black45)
                                )
                              ]
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
                          "incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, "
                          "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                          "Duis aute irure dolor in reprehenderit in ...",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black54
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

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
                  child: TextField(
                    maxLength: 140,
                    maxLines: 10,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Type your comment',
                      border: InputBorder.none
                    ),
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
