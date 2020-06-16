import 'package:flutter/material.dart';
import 'package:twitter_clone/custom_widgets/cover_photo_widget.dart';
import 'package:twitter_clone/custom_widgets/user_profile_photo_widget.dart';
import '../pages/edit_profile_page.dart';

class ProfilePhotoWidget extends StatelessWidget {
  final bool isEditable;
  final List<int> separation;

  ProfilePhotoWidget({
    this.isEditable = false,
    this.separation = const [1,6,1]
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    print("height of screen is  $height");
    return Stack(
      children: <Widget>[
        Container(
          height: height * 0.28,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CoverPhotoWidget(isEditable: isEditable),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(flex: separation[0],child: Container(),),
              Container(
                height: 102,
                width: 102,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2
                  )
                ),
                child: UserProfilePhotoWidget(isEditable: isEditable,),
              ),
              Expanded(flex: separation[1],child: Container(),),
              if(!isEditable)
                OutlineButton(
                  borderSide: BorderSide(color: Colors.blue,width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blue,
                  textColor: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).pushNamed(EditProfilePage.tag);
                  },
                ),
              Expanded(flex: separation[2],child: Container(),),
            ],
          ),
        ),
      ],
    );
  }

}
