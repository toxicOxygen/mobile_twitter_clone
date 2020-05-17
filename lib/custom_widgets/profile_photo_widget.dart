import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    print("height of screem is  $height");
    return Stack(
      children: <Widget>[
        Container(
          height: height * 0.28,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.network(
            'https://tinyurl.com/y86y4ssl',
            height: height * 0.2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(flex: 1,child: Container(),),
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
                child: CircleAvatar(
                  maxRadius: 50,
                  minRadius: 35,
                  backgroundImage: NetworkImage('https://tinyurl.com/yakkyll3'),
                ),
              ),
              Expanded(flex: 6,child: Container(),),
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
                onPressed: (){},
              ),
              Expanded(flex: 1,child: Container(),),
            ],
          ),
        ),
      ],
    );
  }
}
