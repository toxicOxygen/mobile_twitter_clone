import 'package:flutter/material.dart';

class UserProfilePhotoWidget extends StatelessWidget {
  final bool isEditable;
  UserProfilePhotoWidget({
    this.isEditable
  });
  @override
  Widget build(BuildContext context) {
    if(isEditable)
      return Stack(
        children: <Widget>[
          CircleAvatar(
            maxRadius: 50,
            minRadius: 35,
            backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.black26,
                alignment: Alignment.center,
                child: Icon(Icons.camera_alt,color: Colors.white60,),
              ),
            ),
          )
        ],
      );

    return CircleAvatar(
      maxRadius: 50,
      minRadius: 35,
      backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
    );
  }
}
