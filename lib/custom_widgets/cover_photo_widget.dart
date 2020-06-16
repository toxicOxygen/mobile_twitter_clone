import 'package:flutter/material.dart';

class CoverPhotoWidget extends StatelessWidget {
  final bool isEditable;
  CoverPhotoWidget({this.isEditable});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if(isEditable){
      return Stack(
        children: <Widget>[
          Image.network(
            'https://tinyurl.com/y86y4ssl',
            height: height * 0.2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.black26,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon:Icon(Icons.camera_alt),
                    color: Colors.white60,
                    onPressed: (){},
                  ),
                  SizedBox(width: 20,),
                  IconButton(
                    icon:Icon(Icons.close),
                    color: Colors.white60,
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    return Image.network(
      'https://tinyurl.com/y86y4ssl',
      height: height * 0.2,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
