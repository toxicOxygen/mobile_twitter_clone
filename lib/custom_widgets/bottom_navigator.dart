import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/notifications_page.dart';
import '../pages/messages_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final Function onTap;

  MyBottomNavigationBar({
    @required this.currentPageIndex,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Container(height: 0.01,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Container(height: 0.01,)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          title: Container(height: 0.01,)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outline),
          title: Container(height: 0.01,)
        )
      ],
    );
  }
}
