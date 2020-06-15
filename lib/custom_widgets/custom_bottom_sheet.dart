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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Cancel'),
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                  Scaffold.of(context).showBodyScrim(false, 0.1);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}