import 'package:flutter/material.dart';
import '../custom_widgets/profile_photo_widget.dart';

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
      body: Column(
        children: <Widget>[
          ProfilePhotoWidget(),
          Container(
            padding: const EdgeInsets.only(left: 18,top: 10),
            width: double.infinity,
            child: Text('Baffour Kusi',style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          Container(
              padding: const EdgeInsets.only(left: 18),
              width: double.infinity,
              child: Text('@MOBZ',style: TextStyle(color: Colors.black54),)
          )
        ],
      ),
    );
  }
}
