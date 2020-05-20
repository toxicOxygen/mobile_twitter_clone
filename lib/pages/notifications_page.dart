import 'package:flutter/material.dart';
import '../custom_widgets/bottom_navigator.dart';
import '../custom_widgets/appbar_icon_widget.dart';
import '../custom_widgets/sidebar_widget.dart';
import '../sub_pages/notifications_mentions_page.dart';

class NotificationsPage extends StatelessWidget {
  static String tag = 'notifications-page';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(child: SideBarWidget(),),
        backgroundColor: Colors.white,
        bottomNavigationBar: MyBottomNavigationBar(currentPageIndex: 2,),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: AppBarIconWidget(),
              title: Text('Notifications',style: TextStyle(color: Colors.black),),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings,color: Colors.blue,),
                  onPressed: (){},
                )
              ],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text('All',style: TextStyle(color: Colors.black),),
                  ),
                  Tab(
                    child: Text('Mentions',style: TextStyle(color: Colors.black),),
                  )
                ],
              ),
              pinned: true,

            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  MentionsPage(data: ['1'],),
                  Center(child: Text('Page 2'),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
