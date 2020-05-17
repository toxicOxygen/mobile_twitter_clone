import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()=>Scaffold.of(context).openDrawer(),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
          radius: 35,
        ),
      ),
    );
  }
}
