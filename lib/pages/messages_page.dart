import 'package:flutter/material.dart';
import '../custom_widgets/appbar_icon_widget.dart';
import '../custom_widgets/sidebar_widget.dart';
import '../custom_widgets/bottom_navigator.dart';
import '../extras/dummy_data.dart';

class MessagesPage extends StatelessWidget {
  static String tag = 'messages-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(child: SideBarWidget(),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mail_outline),
        onPressed: (){},
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentPageIndex: 3,),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: AppBarIconWidget(),
        title: Text('Messgaes',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Message requests'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider(height: 0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.black12,
                filled: true,
                hintText: 'Search for people and groups',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.01,color: Colors.black12)
                )
              ),
            ),
          ),
          Divider(height: 0,),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (ctx,i){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          minRadius: 20,
                          maxRadius: 25,
                          backgroundImage: NetworkImage('${users[i].imageUrl}'),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: '${users[i].username}  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: '${users[i].tag}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal
                                )
                              )
                            ]
                          ),
                        ),
                        subtitle: Text(users[i].recentMsg),
                        trailing: Text(
                          '${users[i].date}',
                        ),
                      ),
                      Divider(height: 0,)
                    ],
                  );
                },
                itemCount: users.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
