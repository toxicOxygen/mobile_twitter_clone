import 'package:flutter/material.dart';

class MentionsPage extends StatelessWidget {
  final List<String> data; //TODO build an action model and parse it here

  MentionsPage({@required this.data});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemBuilder: (ctx,i)=>ListTile(
       leading: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           CircleAvatar(
             minRadius: 12,
             maxRadius: 15,
             backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
           ),
           SizedBox(height: 20,),
         ],
       ),
       title: Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           CircleAvatar(
             minRadius: 12,
             maxRadius: 15,
             backgroundImage: NetworkImage('https://tinyurl.com/yb6qod88'),
           ),
           SizedBox(height: 5,),
           RichText(
             text: TextSpan(
               style: Theme.of(context).textTheme.headline6.copyWith(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 16,
               ),
               text: 'Nikolass Morenga ',
               children: [
                 TextSpan(
                   text: 'followed you',
                   style: TextStyle(color: Colors.black45)
                 )
               ]
             ),
           )
         ],
       ),
       trailing: IconButton(
         icon: Icon(Icons.keyboard_arrow_down),
         onPressed: (){},
       ),
     ),
     itemCount: data.length,
   );
  }
}
