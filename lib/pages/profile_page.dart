import 'package:flutter/material.dart';
import './create_tweet_page.dart';
import '../custom_widgets/profile_photo_main_widget.dart';
import '../providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';

class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments;

    //TODO change this to consumer
    if(user == null){
      print('hey jose');
      final provider = Provider.of<UserProvider>(context);
      return SubProfile(user: provider.currentUser,);
    }
    return SubProfile(user: user,isOwner: false);
  }
}


class SubProfile extends StatelessWidget {
  final User user;
  final bool isOwner;

  SubProfile({
    @required this.user,
    this.isOwner = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: ListTile(
          title: Text('${user.username}',style: TextStyle(fontWeight: FontWeight.bold),),
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
            ProfilePhotoMainWidget(user: user,)
          ],
        ),
      ),
    );
  }
}

