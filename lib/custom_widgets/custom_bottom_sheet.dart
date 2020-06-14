import 'package:flutter/material.dart';


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 173.45,
      child: Card(
        elevation: .1,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.rotate_left),
              title: Text('Retweet'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.rotate_left),
              title: Text('Retweet with title'),
              onTap: (){},
            ),
            RaisedButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
                Scaffold.of(context).showBodyScrim(false, 0.1);
              },
            )
          ],
        ),
      ),
    );
  }
}