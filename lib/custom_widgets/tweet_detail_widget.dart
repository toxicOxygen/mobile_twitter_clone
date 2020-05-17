import 'package:flutter/material.dart';

class TweetDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            minRadius: 20,
            maxRadius: 25,
            backgroundImage: NetworkImage('https://tinyurl.com/yawxco2g'),
          ),
          title: Text(
            'Virgil van Dijk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('@VirgilvDijk'),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: (){},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
                "incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, "
                "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                "Duis aute irure dolor in reprehenderit in ...",
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.black87
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            width: double.infinity,
            height: height * 0.30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
                image: DecorationImage(
                    image: NetworkImage('https://tinyurl.com/yb6qod88'),
                    fit: BoxFit.cover
                )
            ),
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
