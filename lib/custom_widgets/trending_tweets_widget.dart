import 'package:flutter/material.dart';
import '../extras/dummy_data.dart';

class TrendingTweetsWidget extends StatelessWidget {
  final List<TrendingTag> trending;

  TrendingTweetsWidget({@required this.trending});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 13,top: 10),
          child: Text(
            'Trending',
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.black87,fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Column(
          children: trending.map((e){
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(e.title),
                  subtitle: Text('${e.numberOfTweets} Tweets'),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: (){},
                  ),
                ),
                Divider(height: 0,),
              ],
            );
          }).toList(),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: FlatButton(
            child: Text('Show more'),
            onPressed: (){},
            textColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
