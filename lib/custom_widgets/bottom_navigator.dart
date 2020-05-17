import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;

  MyBottomNavigationBar({@required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (i){
        switch(i){
          case 0:
            Navigator.of(context).pushReplacementNamed(HomePage.tag);
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed(SearchTweetPage.tag);
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
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
