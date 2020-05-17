import 'package:flutter/material.dart';
import './create_tweet_page.dart';
import '../custom_widgets/profile_photo_main_widget.dart';

class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: ListTile(
          title: Text('Baffour Kusi',style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text('827 tweets'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).pushNamed(CreateTweetPage.tag),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfilePhotoMainWidget()
          ],
        ),
      ),
    );
  }
}
